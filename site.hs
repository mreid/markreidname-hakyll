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
  match "_static/css/*" $ do
    route   $ gsubRoute "_static/" (const "")
    compile $ compressCssCompiler

  -----------------
  -- Static Content
  match ".htaccess" $ do
    route   $ idRoute
    compile $ copyFileCompiler

  match "_static/images/**" $ do
    route   $ gsubRoute "_static/" (const "")
    compile $ copyFileCompiler

  match "_static/js/**" $ do
    route   $ gsubRoute "_static/" (const "")
    compile $ copyFileCompiler

  match "_static/guns/**" $ do
    route   $ gsubRoute "_static/" (const "")
    compile $ copyFileCompiler

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

  match "work/pubs/index.markdown" $ do
    route   $ setExtension "html"
    compile $ pandocCompiler >>= pageCompiler "Work"

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
    route   $ blogPostRoute
    compile $ blogPostCompiler

  create ["blog/atom.xml"] $ do
    route   $ idRoute
    compile $ do
      let feedCtx = postCtx `mappend` bodyField "description"
      posts <- recentFirst =<< loadAllSnapshots "blog/posts/*" "content"
      renderAtom feedConfig feedCtx posts

--------------------------------------------------------------------------------
-- Main page
pageCompiler section item =
    loadAndApplyTemplate "_templates/page.html" homeCtx item
    >>= loadAndApplyTemplate "_templates/nav/main.html" homeCtx
    >>= loadAndApplyTemplate "_templates/default.html" homeCtx
    >>= relativizeUrls
    where
      homeCtx = pageCtx section

-- Blog posts
-- Take out the post/YYYY-MM-DD part from the post URL
blogPostRoute = 
  gsubRoute "posts/[0-9]{4}-[0-9]{2}-[0-9]{2}-" (const "")
  `composeRoutes` setExtension "html"

-- Blog page compiler
blogPageCompiler item = 
    loadAndApplyTemplate "_templates/page.html" postCtx item
    >>= loadAndApplyTemplate "_templates/nav/blog.html" postCtx
    >>= loadAndApplyTemplate "_templates/disqus/counts.html" postCtx
    >>= loadAndApplyTemplate "_templates/default.html" postCtx
    -- >>= relativizeUrls


-- Blog index compiler
blogRecentsCompiler n templateID = do
  let ids         = "blog/posts/*"
  let recentCtx   = recentListField "recentposts" ids n templateID postCtx 
 
  pandocCompiler >>= applyAsTemplate (recentCtx `mappend` defaultContext)

-- Blog post compiler
blogPostCompiler = mathJaxRenderer
  >>= loadAndApplyTemplate "_templates/post/full.html" postCtx
  >>= saveSnapshot "content"
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
  
