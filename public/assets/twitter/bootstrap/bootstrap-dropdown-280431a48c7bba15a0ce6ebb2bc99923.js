/* ============================================================
 * bootstrap-dropdown.js v2.3.2
 * http://twitter.github.com/bootstrap/javascript.html#dropdowns
 * ============================================================
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
 * ============================================================ */
!function(t){"use strict";function e(){t(".dropdown-backdrop").remove(),t(n).each(function(){i(t(this)).removeClass("open")})}function i(e){var i,n=e.attr("data-target");return n||(n=e.attr("href"),n=n&&/#/.test(n)&&n.replace(/.*(?=#[^\s]*$)/,"")),i=n&&t(n),i&&i.length||(i=e.parent()),i}var n="[data-toggle=dropdown]",s=function(e){var i=t(e).on("click.dropdown.data-api",this.toggle);t("html").on("click.dropdown.data-api",function(){i.parent().removeClass("open")})};s.prototype={constructor:s,toggle:function(){var n,s,o=t(this);if(!o.is(".disabled, :disabled"))return n=i(o),s=n.hasClass("open"),e(),s||("ontouchstart"in document.documentElement&&t('<div class="dropdown-backdrop"/>').insertBefore(t(this)).on("click",e),n.toggleClass("open")),o.focus(),!1},keydown:function(e){var s,o,r,a,l;if(/(38|40|27)/.test(e.keyCode)&&(s=t(this),e.preventDefault(),e.stopPropagation(),!s.is(".disabled, :disabled"))){if(r=i(s),a=r.hasClass("open"),!a||a&&27==e.keyCode)return 27==e.which&&r.find(n).focus(),s.click();o=t("[role=menu] li:not(.divider):visible a",r),o.length&&(l=o.index(o.filter(":focus")),38==e.keyCode&&l>0&&l--,40==e.keyCode&&l<o.length-1&&l++,~l||(l=0),o.eq(l).focus())}}};var o=t.fn.dropdown;t.fn.dropdown=function(e){return this.each(function(){var i=t(this),n=i.data("dropdown");n||i.data("dropdown",n=new s(this)),"string"==typeof e&&n[e].call(i)})},t.fn.dropdown.Constructor=s,t.fn.dropdown.noConflict=function(){return t.fn.dropdown=o,this},t(document).on("click.dropdown.data-api",e).on("click.dropdown.data-api",".dropdown form",function(t){t.stopPropagation()}).on("click.dropdown.data-api",n,s.prototype.toggle).on("keydown.dropdown.data-api",n+", [role=menu]",s.prototype.keydown)}(window.jQuery);