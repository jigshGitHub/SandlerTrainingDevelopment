/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
config.extraPlugins = "fastimage";
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
    config.toolbar = 'MyToolbar';

    config.toolbar_MyToolbar =
    [
        ['Source','Preview','-','Templates'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
        ['Undo','Redo','-','Find','Replace'],
        ['Link','Unlink','Anchor'],
        '/',        
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
         '/',
        ['Styles','Format','Font','FontSize','TextColor','BGColor'],
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
        ['fastimage','Maximize']

        ,
    ];	
	
};
