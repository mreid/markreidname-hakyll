/**
 * @version		1.0.1
 * @package		AMJR - Asynchronous Multifeed JS Reader
 * @author    Fotis Evangelou - http://nuevvo.gr
 * @copyright	Copyright (c) 2010 - 2012 Nuevvo Webware Ltd. All rights reserved.
 * @license		GNU/GPL license: http://www.gnu.org/copyleft/gpl.html
 */

/*
TO DO for v1.1:
- Convert to jQuery plugin (objectify) so multiple instances can execute on the same page and with different parameters
- Modularize the template
- Create language file
- Add function to limit the size of the .content object element (aka the full content of a feed item)
*/

var count = 2; 					// maximum number of feed items to process per feed
var totalCount = 10; 			// total feed items to output
var proxy = 'google'; 			// google or yql (google is faster)
var containerID = 'amjr';		// the id of a UL element to hold feed results
var loaderID = 'loader';		// the id of the LI element used as the loader

var feedsContainer = [];
var head = document.getElementsByTagName('head')[0];

$(document).ready(function() {
	var feedCount = feeds.length;
	for (var i = 0; i < feedCount; i++) {
		getJSONFeed(feeds[i], count, proxy);
	}
	var container = document.getElementById(containerID);
	
	// Loader layout
	container.innerHTML = '\
		<li id="'+loaderID+'">\
			Loading the '+totalCount+' most recent feed items from a total of ' + feedCount + ' feed sources...\
		</li>\
		';
	
	$(window).load(function(){
		var outputFeedsContainer = feedsContainer.sort(sortByIndex);
		for (var j = 0; j < totalCount; j++) {
			if(j < outputFeedsContainer.length){
				var entry = outputFeedsContainer[j];
				var counter = j+1; // used for the demo only
				var humanDate = new Date(entry.publishedDate); // Some date formatting preparation
				
				// The template layout
				container.innerHTML += '\
					<li>\
						<a target="_blank" title="' + entry.title + '" href="' + entry.link + '">' + entry.title + '</a>\
						<em>' + humanDate.toLocaleDateString() + ' - ' + humanDate.toLocaleTimeString() + '</em>\
						<p>' + entry.contentSnippet + '</p>\
						<span><a href="' + entry.feedLink + '" title="' + entry.feedDescription + '">' + entry.feedTitle + '</a></span>\
					</li>\
				';
			}
		}
		var loader = document.getElementById(loaderID);
		container.removeChild(loader);
	});

});

// Don't edit below this line
function getFeedData(data) {
	if(data.responseData){
		var feedContent = data.responseData.feed;
		var feedEntries = feedContent.entries;
		for (var i = 0; i < feedEntries.length; i++) {
			var entry = feedEntries[i];
			var feedDate = new Date(entry.publishedDate);
			var feedIndex = Math.round(feedDate.getTime() / 1000);
			var feedEntry = {
				"order": feedIndex,
				"publishedDate": entry.publishedDate,
				"title": entry.title,
				"link": entry.link,
				"author": entry.author,
				"contentSnippet": entry.contentSnippet,
				"content": entry.content,
				"feedUrl": feedContent.feedUrl,
				"feedTitle": feedContent.title,
				"feedLink": feedContent.link,
				"feedAuthor": feedContent.author,
				"feedDescription": feedContent.description
			}
			feedsContainer.push(feedEntry);
		}
	}
}

function getJSONFeed(url, count, proxy) {
	if(proxy == 'google'){
		var jsonurl = document.location.protocol + '//ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=' + count + '&callback=getFeedData&q=' + encodeURIComponent(url);
	} else {
		var jsonurl = document.location.protocol + '//query.yahooapis.com/v1/public/yql?q=' + encodeURIComponent('select * from rss where url="' + url + '" limit ' + count) + '&format=json&callback=getFeedData';
	}
	var jsonfeedscript = document.createElement('script');
	jsonfeedscript.setAttribute('charset', 'utf-8');
	jsonfeedscript.setAttribute('type', 'text/javascript');
	jsonfeedscript.setAttribute('src', jsonurl);
	head.appendChild(jsonfeedscript);
}

function sortByIndex(a,b){
	return parseInt(b.order) - parseInt(a.order);
}
