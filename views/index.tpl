<!doctype html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Beego Polymer SPA</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1.0, user-scalable=yes">
  <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

  <script src="static/components/platform/platform.js"></script>
  <link rel="shortcut icon" href="static/img/favicon.ico">
  
  <link rel="import" href="static/elements/elements.html">
  <link href="static/css/app.css" rel="stylesheet" type="text/css" />

  <link href="static/components/core-scaffold/core-scaffold.html" rel="import">
  <link href="static/components/core-toolbar/core-toolbar.html" rel="import">
  <link href="static/components/core-menu/core-menu.html" rel="import">
  <link href="static/components/core-icons/core-icons.html" rel="import">
  <link href="static/components/core-a11y-keys/core-a11y-keys.html" rel="import">
  <link href="static/components/core-ajax/core-ajax.html" rel="import">
  <link href="static/components/core-icon-button/core-icon-button.html" rel="import">
  <link href="static/components/core-animated-pages/core-animated-pages.html" rel="import">
  <link href="static/components/core-animated-pages/transitions/slide-from-right.html" rel="import">

  <link href="static/components/paper-item/paper-item.html" rel="import">

  <link href="static/components/flatiron-director/flatiron-director.html" rel="import">
  <link href="static/components/font-roboto/roboto.html" rel="import">

  <base target="_blank"></base>
  
  <style>
    core-animated-pages > *  {
      font-size: inherit;
      overflow-y: auto;
      padding: 30px;
    }
  </style>

</head>

<body unresolved fullbleed>
  <template is="auto-binding" id="t">

  <!-- Route controller. -->
  <flatiron-director route="{{route}}" autohash></flatiron-director>
  
  <!-- Keyboard nav controller. -->
  <core-a11y-keys target="{{parentElement}}"
                keys="up down left right space space+shift"
                on-keys-pressed="{{keyHandler}}"></core-a11y-keys>  

  <!-- Dynamic content controller -->
  <core-ajax id="ajax" url="{{selectedPage.page.url}}" handleAs="document" on-core-response="{{ onResponse }}"></core-ajax>              

   <core-scaffold id="scaffold">
  
      <!-- Menu -->
      <nav>
        <core-toolbar id="menu_header">
          <span id="menu_title">Name</span>
        </core-toolbar>
          <core-menu id="menu" valueattr="hash" 
                     selected="{{route}}" 
                     selectedmodel="{{selectedPage}}" 
                     on-core-select="{{ menuItemSelected }}" on-click="{{ajaxLoad}}">

              <paper-item noink>
      <core-icon icon="label-outline"></core-icon>
      <a href="#one">Profile</a>
    </paper-item>
    <paper-item noink>
      <core-icon icon="label-outline"></core-icon>
      <a href="#two">Services</a>
    </paper-item>
        <paper-item noink>
      <core-icon icon="label-outline"></core-icon>
      <a href="#two">Hacks</a>
    </paper-item>
          
        </core-menu>
      </nav>
  
      <!-- Content Section -->
      <core-toolbar tool flex id="content_header">
      <div flex id="content_title">{{selectedPage.page.name}}</div>
        <core-icon-button icon="refresh"></core-icon-button>
        <core-icon-button icon="add"></core-icon-button>
      </core-toolbar>

      <!-- Loaded Content Area -->
      <div layout horizontal center-center fit>
        <core-animated-pages id="pages" selected="{{route}}" valueattr="hash"
                           transitions="slide-from-right">
        <template repeat="{{page, i in pages}}">
          <section hash="{{page.hash}}" layout vertical center-center>
            <div style="max-width:100%;">Loading...</div>
          </section>
        </template>
      </core-animated-pages>
      </div>
    
    </core-scaffold>
  </template>
 <script src="static/js/app.js"></script>

</body>

</html>