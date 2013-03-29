--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Control.Applicative ((<$>), empty)
import           Data.Monoid         (mappend)
import           Hakyll

import Text.Pandoc.Shared
import Text.Pandoc.Options

--------------------------------------------------------------------------------
destDir = "/Users/mreid/Sites/hakylltest/"
remote = "confla@conflate.net:www/name" 
siteConfig = defaultConfiguration
  { destinationDirectory  = destDir,
    storeDirectory        = "/tmp/hakyll_cache/mark.reid.name/",
    deployCommand         = "rsync -ave ssh " ++ destDir ++ " " ++ remote 
  }

feedConfig = FeedConfiguration
    { feedTitle       = "Inductio Ex Machina"
    , feedDescription = "Thoughts on Machine Learning and Inference"
    , feedAuthorName  = "Mark Reid"
    , feedAuthorEmail = "mark@reid.name"
    , feedRoot        = "http://mark.reid.name"
    }

--------------------------------------------------------------------------------
main :: IO ()
main = hakyllWith siteConfig $ do
  -----------------
  -- Templates
  match "_templates/**" $ compile templateCompiler
  
  -----------------
  -- CSS
  match "css/**" $ do
    route   $ idRoute
    compile $ compressCssCompiler

  -----------------
  -- Static Content (including .htaccess)
  match "_static/**" $ do
    route   $ gsubRoute "_static/" (const "")
    compile $ copyFileCompiler

  -----------------
  -- 404 Page
  match "404.md" $ do
    route   $ setExtension "html"
    compile $ pandocCompiler >>= pageCompiler "Home"

  -----------------
  -- Home
  match "index.markdown" $ do
    route   $ setExtension "html"
    compile $ blogRecentsCompiler (Just 3) "_templates/post/short.html"
              >>= pageCompiler "Home"
  
  -----------------
  -- Info
  match "info/*.markdown" $ do
    route   $ setExtension "html"
    compile $ pandocCompiler >>= pageCompiler "Info"

  -----------------
  -- Code
  match "code/**.markdown" $ do
    route   $ setExtension "html"
    compile $ pandocCompiler >>= pageCompiler "Code"

  -----------------
  -- Work
  match "work/index.markdown" $ do
    route   $ setExtension "html"
    compile $ pandocCompiler >>= pageCompiler "Work"

  match "work/pubs/**.markdown" $ do
    route   $ setExtension "html"
    compile $ pandocCompiler >>= pageCompiler "Work"

  -----------------
  -- Notes
  match "work/note/*.bib" $ compile $ biblioCompiler
  match "work/note/*.csl" $ compile $ cslCompiler

  match "work/note/**.markdown" $ do
    route   $ setExtension "html"
    compile $ bibtexCompiler >>= pageCompiler "Work"

  -----------------
  -- Blog
  match "blog/index.markdown" $ do
    route   $ setExtension "html"
    compile $ blogRecentsCompiler (Just 5) "_templates/post/excerpt.html"
              >>= blogPageCompiler

  match "blog/past.markdown" $ do
    route   $ setExtension "html"
    compile $ blogRecentsCompiler Nothing "_templates/post/excerpt.html"
              >>= blogPageCompiler

  match (fromList ["blog/info.markdown", "blog/kith.markdown"]) $ do
    route   $ setExtension "html"
    compile $ pandocCompiler >>= blogPageCompiler

  -- Posts
  match "blog/posts/*" $ do
    route   $ gsubRoute "posts" (const "") `composeRoutes` rmDateRoute
    compile $ blogPostCompiler True
  
  -- Drafts
  match "blog/drafts/*" $ do
    route   $ rmDateRoute
    compile $ blogPostCompiler False

  -- Atom / RSS
  create ["blog/atom.xml"] $ do
    route   $ idRoute
    compile $ do
      let feedCtx = postCtx `mappend` bodyField "description"
      posts <- fmap (take 5) . recentFirst =<< loadAllSnapshots "blog/posts/*" "content"
      renderAtom feedConfig feedCtx posts

--------------------------------------------------------------------------------
-- Compile pages by wrapping in standard templates
pageCompiler section item =
    loadAndApplyTemplate "_templates/page.html" homeCtx item
    >>= loadAndApplyTemplate "_templates/nav/main.html" homeCtx
    >>= loadAndApplyTemplate "_templates/default.html" homeCtx
    >>= relativizeUrls
    where
      homeCtx = pageCtx section

-- Compile pages with Pandoc's citations resolved against a BibTeX file
bibtexCompiler = do 
  csl <- load "work/note/siggraph.csl"
  bib <- load "work/note/refs.bib"

  getResourceBody 
    >>= readPandocBiblio def (Just csl) bib 
    >>= return . writePandoc

-- Blog posts
-- Take out the post/YYYY-MM-DD part from the post URL
rmDateRoute = 
  gsubRoute "/[0-9]{4}-[0-9]{2}-[0-9]{2}-" (const "/")
  `composeRoutes` setExtension "html"

-- Blog page compiler
blogPageCompiler item = 
    loadAndApplyTemplate "_templates/page.html" postCtx item
    >>= loadAndApplyTemplate "_templates/nav/blog.html" postCtx
    >>= loadAndApplyTemplate "_templates/disqus/counts.html" postCtx
    >>= loadAndApplyTemplate "_templates/default.html" postCtx
    >>= relativizeUrls

-- Blog index compiler
blogRecentsCompiler n templateID = do
  let ids         = "blog/posts/*"
  let recentCtx   = recentListField "recentposts" ids n templateID postCtx 
 
  pandocCompiler >>= applyAsTemplate (recentCtx `mappend` defaultContext)

-- Blog post compiler
blogPostCompiler snapshot = mathJaxRenderer
  >>= loadAndApplyTemplate "_templates/post/full.html" postCtx
  >>= (if snapshot then (saveSnapshot "content") else return . id)
  >>= loadAndApplyTemplate "_templates/nav/blog.html" postCtx
  >>= loadAndApplyTemplate "_templates/default.html" postCtx
  >>= relativizeUrls

-- Pandoc render with MathJax enabled
mathJaxRenderer =
  pandocCompilerWith def def { writerHTMLMathMethod = MathJax "" }

-- Set various fields for front pages
pageCtx :: String -> Context String
pageCtx section =
  constField "top" "Mark Reid" `mappend`
  constField "section" section `mappend`
  defaultContext

-- Set various fields for blog posts
postCtx :: Context String
postCtx =
  dateField "date" "%B %e, %Y" `mappend`
  dateField "shortdate" "%e %b %y" `mappend` 
  constField "top" "Inductio Ex Machina &larr; Mark Reid" `mappend`
  constField "section" "Blog" `mappend`
  defaultContext

--------------------------------------------------------------------------------
-- Helper functions
maybeTake Nothing  = id
maybeTake (Just n) = fmap (take n)
recentListField key ids n templateID context = 
  Context $ \k _ -> 
    if (k==key) then do
      items     <- (maybeTake n) . recentFirst =<< loadAll ids
      template  <- loadBody templateID
      applyTemplateList template context items
	else empty
  
