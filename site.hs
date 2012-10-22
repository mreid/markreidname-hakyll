{-# LANGUAGE OverloadedStrings #-}
-- Hakyll Configuration for http://mark.reid.name
--
-- AUTHOR: 	Mark Reid <mark@reid.name>
-- CREATED: 2012-10-17
module Main where

import Prelude hiding (id)
import Control.Category (id)
import Control.Arrow ((>>>), (***), arr)
import Control.Monad(forM_)
import Data.Monoid (mempty, mconcat)

import Text.Pandoc.Shared

import Hakyll

-- Set up custom configuration
-- 	Cache in /tmp ; Compiled site in ~/Sites/ ; Deploy to conflate.net
siteConfig = defaultHakyllConfiguration 
	{	destinationDirectory 	= destDir,
		storeDirectory 			= "/tmp/hakyll_cache/mark.reid.name/",
		deployCommand 			= "rsync -ave ssh " ++ destDir 
									++ " confla@conflate.net:www/name" }
	where
   		destDir = "/Users/mreid/Sites/hakylltest/"

feedConfig = FeedConfiguration 
	{ 	feedTitle		= "Inductio Ex Machina",
		feedDescription = "A research blog on machine learning.",
		feedAuthorName	= "Mark Reid",
		feedAuthorEmail	= "mark@reid.name",
		feedRoot		= "http://mark.reid.name/blog/" }

-- Run the compilation process
main :: IO ()
main = hakyllWith siteConfig $ do
    -- Read includes
	match "_includes/**" $ compile readPageCompiler

    -- Read templates
	match "_templates/**" $ compile templateCompiler
	
	-- Copy all static files (e.g., images, css, javascript)
	-- and remove the leading `static` directory from each path
	match "_static/**" $ do
	    route 	$ gsubRoute "_static/" (const "")
	    compile	$ copyFileCompiler	

	-- Main
	match "index.markdown" $ do
		route	$ setExtension ".html"
		compile	$ recentPostsCompiler (Just 3) "short" 
			>>> outerCompiler "nav"

	-- Info
	match "info/*.markdown" $ do
		route   $ setExtension ".html"
		compile $ pageCompiler >>> outerCompiler "nav"

	-- Code: text
	match "code/***.markdown" $ do
		route	$ setExtension ".html"
		compile	$ pageCompiler >>> outerCompiler "nav"

	-- Code: files
	match "code/**/*.js" $ do
		route	$ idRoute
		compile	$ copyFileCompiler
	
	----------	
	-- Inductio Ex Machina 
	
	-- Create IEM index
	match "blog/index.markdown" $ do
		route	$ setExtension ".html"
		compile	$ recentPostsCompiler (Just 5) "excerpt" 
			>>> outerCompiler "iem-nav"
	
	-- Create IEM archive page
	match "blog/past.markdown" $ do
		route	$ setExtension ".html"
		compile	$ recentPostsCompiler Nothing "excerpt" 
			>>> outerCompiler "iem-nav"
	
	-- Create other IEM pages
	forM_ ["blog/info.markdown", "blog/kith.markdown"] $ \p ->
		match p $ do
            route   $ setExtension ".html"
            compile $ pageCompiler >>> outerCompiler "iem-nav"
	
    -- Render posts
	match "blog/posts/*" $ do
        route   $ removePostDateRoute
        compile $ postCompiler
			>>> setFieldPage "mathjax" "_includes/mathjax.html"
			>>> setFieldPage "navigation" "_includes/iem-nav.html"
			>>> applyTemplateCompiler "_templates/post/full.html" 
			>>> applyTemplateCompilerWith 
					(const "") "_templates/default.html" 
	
	----------
	-- Atom Feed
	-- match 	"blog/atom.xml" $ route idRoute
	-- create	"blog/atom.xml" $ 
	-- 	requireAll_ "blog/posts/*" >>> renderAtom feedConfig

-- Get the n most recent pages
newest Nothing 	= recentFirst
newest (Just n) = take n . recentFirst

-- Create a route without the date in the post filename
removePostDateRoute = 
	(gsubRoute "posts/[0-9]{4}-[0-9]{2}-[0-9]{2}-" (const "")) 
	`composeRoutes` (setExtension ".html")


-- Compile the navigation and outer HTML around a page.
-- The @navigation@ parameter is an @Identifier@ for the navigation elements
-- to include.
outerCompiler navigation =
	setFieldPage "navigation" navTemplate
	>>> applyTemplateCompiler "_templates/page.html"
	>>> applyTemplateCompilerWith (const "") "_templates/default.html" 
	where
		navTemplate = parseIdentifier $ "_includes/" ++ navigation ++ ".html"

-- Compile posts
postCompiler = readPageCompiler
	>>> mathJaxRenderer
	>>> addDefaultFields
	>>> arr (setField "top" "Inductio Ex Machina") 
    >>> arr (renderDateField "date" "%B %e, %Y" "Date unknown")
	>>> arr (renderDateField "shortdate" "%e %b %y" "(No date)")
	>>> arr applySelf 

-- Compile a page that includes a list of posts.
-- The resulting page has its @$recentposts$@ key replaced with @number@ 
-- recent blog posts rendered with the given pattern @kind@.
recentPostsCompiler number kind =
	readPageCompiler
	>>> addDefaultFields
	>>> setPageList "recentposts" number kind "blog/posts/*"
	>>> setFieldPage "disquscounts" "_includes/disqus-count.html"
	>>> arr (copyField "excerpt" "description")
	>>> arr (setField "feed" 
		"<link rel='alternate' type='application/atom+xml' href='/blog/atom.xml' title='RSS feed' />")
	>>> arr applySelf
	>>> pageRenderPandoc

-- Shorthand for setting a field with a list of posts 
setPageList key number kind collection =
	setFieldPageList (newest number) template key collection
	where
		template = parseIdentifier ("_templates/post/" ++ kind ++ ".html")

-- Pandoc render with MathJax enabled
mathJaxRenderer =
	pageRenderPandocWith 
		defaultHakyllParserState
		defaultHakyllWriterOptions { writerHTMLMathMethod = MathJax "" }
