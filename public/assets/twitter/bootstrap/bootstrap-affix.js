/* ==========================================================
 * bootstrap-affix.js v2.3.2
 * http://twitter.github.com/bootstrap/javascript.html#affix
 * ==========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */
!function(t){"use strict";var e=function(e,i){this.options=t.extend({},t.fn.affix.defaults,i),this.$window=t(window).on("scroll.affix.data-api",t.proxy(this.checkPosition,this)).on("click.affix.data-api",t.proxy(function(){setTimeout(t.proxy(this.checkPosition,this),1)},this)),this.$element=t(e),this.checkPosition()};e.prototype.checkPosition=function(){if(this.$element.is(":visible")){var e,i=t(document).height(),n=this.$window.scrollTop(),s=this.$element.offset(),o=this.options.offset,r=o.bottom,a=o.top,l="affix affix-top affix-bottom";"object"!=typeof o&&(r=a=o),"function"==typeof a&&(a=o.top()),"function"==typeof r&&(r=o.bottom()),e=null!=this.unpin&&n+this.unpin<=s.top?!1:null!=r&&s.top+this.$element.height()>=i-r?"bottom":null!=a&&a>=n?"top":!1,this.affixed!==e&&(this.affixed=e,this.unpin="bottom"==e?s.top-n:null,this.$element.removeClass(l).addClass("affix"+(e?"-"+e:"")))}};var i=t.fn.affix;t.fn.affix=function(i){return this.each(function(){var n=t(this),s=n.data("affix"),o="object"==typeof i&&i;s||n.data("affix",s=new e(this,o)),"string"==typeof i&&s[i]()})},t.fn.affix.Constructor=e,t.fn.affix.defaults={offset:0},t.fn.affix.noConflict=function(){return t.fn.affix=i,this},t(window).on("load",function(){t('[data-spy="affix"]').each(function(){var e=t(this),i=e.data();i.offset=i.offset||{},i.offsetBottom&&(i.offset.bottom=i.offsetBottom),i.offsetTop&&(i.offset.top=i.offsetTop),e.affix(i)})})}(window.jQuery);