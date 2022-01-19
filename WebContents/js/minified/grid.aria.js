!function(e){"use strict";"function"==typeof define&&define.amd?define(["jquery","./grid.base"],e):e(jQuery)}(function(C){"use strict";C.extend(C.jgrid,{focusableElementsList:[">a[href]",">button:not([disabled])",">area[href]",">input:not([disabled])",">select:not([disabled])",">textarea:not([disabled])",">iframe",">object",">embed",">*[tabindex]",">*[contenteditable]"]}),C.jgrid.extend({ariaBodyGrid:function(e){var u=C.extend({onEnterCell:null},e||{});return this.each(function(){var n=this,i=C.jgrid.getMethod("getStyleUI"),l=i(n.p.styleUI+".common","highlight",!0);function a(e,t){return!isNaN(e)&&!isNaN(t)&&0<=e&&0<=t&&n.rows.length&&e<n.rows.length&&t<n.p.colModel.length}function r(e,t){var i=n.p.iRow+t,r=n.p.iCol+e,o=n.rows.length,t=0!==e;if(!o)return!1;e=n.p.colModel.length;return t&&(r<0&&2<=i&&(r=e-1,i--),e<=r&&(r=0,i++)),t||(i<1?(r--,n.rows[i=o-1]&&0<=r&&!n.rows[i].cells[r]&&i--):(o<=i||!n.rows[i].cells[r])&&(i=1,r++)),a(i,r)?{row:i,col:r}:!!a(n.p.iRow,n.p.iCol)&&{row:n.p.iRow,col:n.p.iCol}}function o(e,t){var i=r(e,t);if(!i)return!1;for(;C(n.rows[i.row].cells[i.col]).is(":hidden");)if(n.p.iRow=i.row,n.p.iCol=i.col,i=r(e,t),n.p.iRow===i.row&&n.p.iCol===i.col)return!1;return 0!==t&&C(n).jqGrid("setSelection",n.rows[i.row].id,!1,null,!1),i}function d(e){var t=n.p.page,i=n.p.lastpage;n.p.page!==(t=i<(t=(t+=e)<=0?1:t)?i:t)&&(n.p.page=t,n.grid.populate())}var t=C.jgrid.focusableElementsList.join();C(n).removeAttr("tabindex"),C(n).on("jqGridAfterGridComplete.setAriaGrid",function(e){C("tbody",n).first().find(">tr:not(.jqgfirstrow)>td:not(:hidden, :has("+t+"))").attr("tabindex",-1),C("tbody",n).first().find(">tr:not(.jqgfirstrow)").removeAttr("tabindex"),void 0!==n.p.iRow&&void 0!==n.p.iCol&&n.rows[n.p.iRow]&&C(n.rows[n.p.iRow].cells[n.p.iCol]).attr("tabindex",0).focus(function(){C(this).addClass(l)}).blur(function(){C(this).removeClass(l)})}),n.p.iRow=1,n.p.iCol=C.jgrid.getFirstVisibleCol(n);var s=0,c=0,p=!!C.jgrid.isFunction(u.customCellAction)&&u.customCellAction;C(n).on("keydown",function(e){if(!n.p.navigationDisabled||!0!==n.p.navigationDisabled){var t;switch(e.which||e.keyCode){case 38:t=o(0,-1),s=t.row,c=t.col,e.preventDefault();break;case 40:t=o(0,1),s=t.row,c=t.col,e.preventDefault();break;case 37:t=o(-1,0),s=t.row,c=t.col,e.preventDefault();break;case 39:t=o(1,0),s=t.row,c=t.col,e.preventDefault();break;case 36:s=e.ctrlKey?1:n.p.iRow,c=0,e.preventDefault();break;case 35:s=e.ctrlKey?n.rows.length-1:n.p.iRow,c=n.p.colModel.length-1,e.preventDefault();break;case 33:d(-1),c=n.p.iCol,s=n.p.iRow,e.preventDefault();break;case 34:d(1),c=n.p.iCol,(s=n.p.iRow)>n.rows.length-1&&(s=n.rows.length-1,n.p.iRow=n.rows.length-1),e.preventDefault();break;case 13:return void(C.jgrid.isFunction(u.onEnterCell)&&(u.onEnterCell.call(n,n.rows[n.p.iRow].id,n.p.iRow,n.p.iCol,e),e.preventDefault()));case 113:try{C(n).jqGrid("editCell",n.p.iRow,n.p.iCol,!0,e)}catch(e){}default:return void(p&&p.call(n,n.rows[n.p.iRow].id,n.p.iRow,n.p.iCol,e))}C(n).jqGrid("focusBodyCell",s,c,i,l)}}),C(n).on("jqGridBeforeSelectRow.ariaGridClick",function(){return!1}),C(n).on("jqGridCellSelect.ariaGridClick",function(e,t,i,r,o){var a=o.target;0<n.p.iRow&&0<=n.p.iCol&&C(n.rows[n.p.iRow].cells[n.p.iCol]).attr("tabindex",-1),(C(a).is("td")||C(a).is("th"))&&(n.p.iCol=a.cellIndex,o=C(a).closest("tr.jqgrow"),n.p.iRow=o[0].rowIndex,C(a).attr("tabindex",0).addClass(l).focus().blur(function(){C(this).removeClass(l)}))}),n.p.ariaBody=!0})},excelLikeGrid:function(e){var b=C.extend({beforeDeleteCell:null,customCellAction:null,customUndoFunction:null,specialChars:["~","!","@","#","$","%","^","&","*","(",")","_","+","{","}",":",'"',"|","<",">","?",",",".","/",";","\\","[","]"],addonChars:!1},e||{});return this.each(function(){var n=this,l=C.jgrid.getMethod("getStyleUI"),d=l(n.p.styleUI+".common","highlight",!0);function a(e,t){return!isNaN(e)&&!isNaN(t)&&0<=e&&0<=t&&n.rows.length&&e<n.rows.length&&t<n.p.colModel.length}function r(e,t){var i=n.p.iRow+t,r=n.p.iCol+e,o=n.rows.length,t=0!==e,e=n.p.frozenColumns?n.p.frozenColCount+1:0;if(!o)return!1;o=n.p.colModel.length;return t&&(r=r<e?e:r)===o&&(r=o),t||n.rows[i]&&0<=r&&!n.rows[i].cells[r]&&i--,a(i,r)?{row:i,col:r}:!!a(n.p.iRow,n.p.iCol)&&{row:n.p.iRow,col:n.p.iCol}}function s(e,t){var i=r(e,t);if(!i)return!1;for(;C(n.rows[i.row].cells[i.col]).is(":hidden");)if(n.p.iRow=i.row,n.p.iCol=i.col,i=r(e,t),n.p.iRow===i.row&&n.p.iCol===i.col)return!1;return 0!==t&&C(n).jqGrid("setSelection",n.rows[i.row].id,!1,null,!1),i}function c(e){var t=n.p.page,i=n.p.lastpage;n.p.page!==(t=i<(t=(t+=e)<=0?1:t)?i:t)&&(n.p.page=t,n.grid.populate())}n.p.F2key=!1;var t=C.jgrid.focusableElementsList.join();C(n).removeAttr("tabindex"),C(n).on("jqGridAfterGridComplete.setAriaGrid",function(e){C("tbody",n).first().find(">tr:not(.jqgfirstrow)>td:not(:hidden, :has("+t+"))").attr("tabindex",-1),C("tbody",n).first().find(">tr:not(.jqgfirstrow)").removeAttr("tabindex"),void 0!==n.p.iRow&&void 0!==n.p.iCol&&n.rows[n.p.iRow]&&C(n.rows[n.p.iRow].cells[n.p.iCol]).attr("tabindex",0).focus(function(){C(this).addClass(d)}).blur(function(){C(this).removeClass(d)})}),n.p.iRow=1,n.p.iCol=C.jgrid.getFirstVisibleCol(n),n.p.ariaBody=!0;var p=0,u=0,f=!!C.jgrid.isFunction(b.customCellAction)&&b.customCellAction,h=!!C.jgrid.isFunction(b.beforeDeleteCell)&&b.beforeDeleteCell,w=new Set(b.specialChars),g=!1;n.addEventListener("paste",e=>{g&&(e=(e.clipboardData||window.clipboardData).getData("text"),C(n).jqGrid("saveCell",n.p.iRow,n.p.iCol,e),g=!1)}),C(n).on("keydown",function(e){if(!n.p.navigationDisabled||!0!==n.p.navigationDisabled){var t=e.which||e.keyCode,i=e.ctrlKey||17===t;switch(t){case 38:a=s(0,-1),p=a.row,u=a.col,e.preventDefault();break;case 40:case 13:a=s(0,1),p=a.row,u=a.col,e.preventDefault();break;case 37:a=s(-1,0),p=a.row,u=a.col,e.preventDefault();break;case 39:a=s(1,0),p=a.row,u=a.col,e.preventDefault();break;case 36:p=e.ctrlKey?1:n.p.iRow,u=n.p.frozenColumns?n.p.frozenColCount+1:0,e.preventDefault();break;case 35:p=e.ctrlKey?n.rows.length-1:n.p.iRow,u=n.p.colModel.length-1,e.preventDefault();break;case 33:c(-1),u=n.p.iCol,p=n.p.iRow,e.preventDefault();break;case 34:c(1),u=n.p.iCol,(p=n.p.iRow)>n.rows.length-1&&(p=n.rows.length-1,n.p.iRow=n.rows.length-1),e.preventDefault();break;case 9:a=e.shiftKey?s(-1,0):s(1,0),p=a.row,u=a.col,e.preventDefault();break;case 113:try{C(n).jqGrid("editCell",n.p.iRow,n.p.iCol,!0,e,!1),n.p.F2key=!0}catch(e){}break;case 8:case 46:var r=!0;!0===(r=h?h.call(n,n.rows[n.p.iRow].id,n.p.iRow,n.p.iCol,e):r)&&C(n).jqGrid("saveCell",n.p.iRow,n.p.iCol,"");break;case 86:if(i)return g=!0;case 90:if(i){var o=!0;return(o=C.jgrid.isFunction(b.customUndoFunction)?b.customUndoFunction.call(n,n.rows[n.p.iRow].id,n.p.iRow,n.p.iCol,e):o)&&n.p.savedValues&&C(n).jqGrid("getCell",n.rows[n.p.iRow].id,n.p.colModel[n.p.iCol].name,!1)===n.p.savedValues.newvalue&&n.p.iRow===n.p.savedValues.indexRow&&C(n).jqGrid("saveCell",n.p.iRow,n.p.iCol,n.p.savedValues.oldvalue),!0}default:var a=/^[a-z]$/i.test(e.key),r=/^[0-9]$/i.test(e.key),o=!1;return b.addonChars&&(o=b.addonChars.test(e.key)),(a||r||w.has(e.key)||o)&&C(n).jqGrid("editCell",n.p.iRow,n.p.iCol,!0,e,!0),void(f&&f.call(n,n.rows[n.p.iRow].id,n.p.iRow,n.p.iCol,e))}C(n).jqGrid("focusBodyCell",p,u,l,d)}}),C(n).on("jqGridBeforeSelectRow.ariaGridClick",function(){return!1}),C(n).on("jqGridCellSelect.ariaGridClick",function(e,t,i,r,o){var a=o.target;0<n.p.iRow&&0<=n.p.iCol&&C(n.rows[n.p.iRow].cells[n.p.iCol]).attr("tabindex",-1),(C(a).is("td")||C(a).is("th"))&&(n.p.iCol=a.cellIndex,n.p.savedRow.length&&C(n).jqGrid("saveCell",n.p.savedRow[0].id,n.p.savedRow[0].ic),o=C(a).closest("tr.jqgrow"),n.p.iRow=o[0].rowIndex,C(a).attr("tabindex",0).addClass(d).focus().blur(function(){C(this).removeClass(d)}))}).on("jqGridDblClickRow.ariaGridDblClick",function(e,t,i,r,o){C(n).jqGrid("editCell",i,r,!0,o,!1),n.p.F2key=!0})})},focusBodyCell:function(n,l,d,s){return this.each(function(){var e,t=this,i=d||C.jgrid.getMethod("getStyleUI"),r=s||i(t.p.styleUI+".common","highlight",!0),o=C.jgrid.focusableElementsList.join();function a(e){return C(o,e)[0]}void 0!==n&&void 0!==l?!isNaN(t.p.iRow)&&!isNaN(t.p.iCol)&&0<=t.p.iCol&&(e=a(t.rows[t.p.iRow].cells[t.p.iCol]),C(e||t.rows[t.p.iRow].cells[t.p.iCol]).attr("tabindex",-1)):(n=t.p.iRow,l=t.p.iCol),n=parseInt(n,10),l=parseInt(l,10),0<n&&0<=l&&(e=a(t.rows[n].cells[l]),C(e||t.rows[n].cells[l]).attr("tabindex",0).addClass(r).focus().blur(function(){C(this).removeClass(r)}),t.p.iRow=n,t.p.iCol=l)})},resetAriaBody:function(){return this.each(function(){var t=this,i=!1;t.p.ariaBody=!1,C(t).attr("tabindex","0").off("keydown").off("jqGridBeforeSelectRow.ariaGridClick").off("jqGridCellSelect.ariaGridClick").off("jqGridAfterGridComplete.setAriaGrid");var e=C.jgrid.focusableElementsList.join();C("tbody",t).first().find(">tr:not(.jqgfirstrow)>td:not(:hidden, :has("+e+"))").removeAttr("tabindex").off("focus"),C("tbody",t).first().find(">tr:not(.jqgfirstrow)").attr("tabindex",-1);try{t.removeEventListener("paste",e=>{i&&(e=(e.clipboardData||window.clipboardData).getData("text"),C(t).jqGrid("saveCell",t.p.iRow,t.p.iCol,e),i=!1)},!0)}catch(e){}})},ariaHeaderGrid:function(){return this.each(function(){var o=this,e=C.jgrid.getMethod("getStyleUI")(o.p.styleUI+".common","highlight",!0),t=C("#gbox_"+o.p.id).find(".ui-jqgrid-hbox>table").first();C("tr.ui-jqgrid-labels",t).on("keydown",function(e){var t=o.p.selHeadInd,i=e.which||e.keyCode,r=o.grid.headers.length;switch(i){case 37:if(0<=t-1){for(t--;C(o.grid.headers[t].el).is(":hidden")&&0<=t-1&&!(--t<0););0<=t&&(C(o.grid.headers[t].el).focus(),C(o.grid.headers[o.p.selHeadInd].el).attr("tabindex","-1"),o.p.selHeadInd=t,e.preventDefault())}break;case 39:if(t+1<r){for(t++;C(o.grid.headers[t].el).is(":hidden")&&t+1<r&&!(r-1<++t););t<r&&(C(o.grid.headers[t].el).focus(),C(o.grid.headers[o.p.selHeadInd].el).attr("tabindex","-1"),o.p.selHeadInd=t,e.preventDefault())}break;case 13:C(o.grid.headers[t].el).find("div").first().trigger("click"),e.preventDefault();break;default:return}}),C("tr.ui-jqgrid-labels>th:not(:hidden)",t).attr("tabindex",-1).focus(function(){C(this).addClass(e).attr("tabindex","0")}).blur(function(){C(this).removeClass(e)}),o.p.selHeadInd=C.jgrid.getFirstVisibleCol(o),C(o.grid.headers[o.p.selHeadInd].el).attr("tabindex","0")})},focusHeaderCell:function(t){return this.each(function(){var e=this;0<=(t=void 0===t?e.p.selHeadInd:t)&&t<e.p.colModel.length&&(C(e.grid.headers[e.p.selHeadInd].el).attr("tabindex","-1"),C(e.grid.headers[t].el).focus(),e.p.selHeadInd=t)})},resetAriaHeader:function(){return this.each(function(){var e=C("#gbox_"+this.p.id).find(".ui-jqgrid-hbox>table").first();C("tr.ui-jqgrid-labels",e).off("keydown"),C("tr.ui-jqgrid-labels>th:not(:hidden)",e).removeAttr("tabindex").off("focus blur")})},ariaPagerGrid:function(){return this.each(function(){var r=this,e=C.jgrid.getMethod("getStyleUI"),t=e(r.p.styleUI+".common","highlight",!0),o="."+e(r.p.styleUI+".common","disabled",!0),a=C(".ui-pg-button",r.p.pager),n=a.length;a.attr("tabindex","-1").focus(function(){C(this).addClass(t)}).blur(function(){C(this).removeClass(t)}),r.p.navIndex=0,setTimeout(function(){var e=a.not(o).first().attr("tabindex","0");r.p.navIndex=e[0]&&e[0].cellIndex?e[0].cellIndex-1:0},100),C(r.p.pager).find("table.ui-pager-table tr").first().on("keydown",function(e){var t=e.which||e.keyCode,i=r.p.navIndex;switch(t){case 37:if(0<=i-1){for(i--;C(a[i]).is(o)&&0<=i-1&&!(--i<0););0<=i&&(C(a[r.p.navIndex]).attr("tabindex","-1"),C(a[i]).attr("tabindex","0").focus(),r.p.navIndex=i),e.preventDefault()}break;case 39:if(i+1<n){for(i++;C(a[i]).is(o)&&i+1<n+1&&!(n-1<++i););i<n&&(C(a[r.p.navIndex]).attr("tabindex","-1"),C(a[i]).attr("tabindex","0").focus(),r.p.navIndex=i),e.preventDefault()}break;case 13:C(a[i]).trigger("click"),e.preventDefault();break;default:return}})})},focusPagerCell:function(i){return this.each(function(){var e=C(".ui-pg-button",this.p.pager),t=e.length;0<=(i=void 0===i?this.p.navIndex:i)&&i<t&&(C(e[this.p.navIndex]).attr("tabindex","-1"),C(e[i]).attr("tabindex","0").focus(),this.p.navIndex=i)})},resetAriaPager:function(){return this.each(function(){C(".ui-pg-button",this.p.pager).removeAttr("tabindex").off("focus"),C(this.p.pager).find("table.ui-pager-table tr").first().off("keydown")})},setAriaGrid:function(e){var t=C.extend({header:!0,body:!0,pager:!0,onEnterCell:null,customCellAction:null,excel:!1},e||{});return this.each(function(){t.header&&C(this).jqGrid("ariaHeaderGrid"),t.body&&(t.excel?C(this).jqGrid("excelLikeGrid",t):C(this).jqGrid("ariaBodyGrid",t)),t.pager&&C(this).jqGrid("ariaPagerGrid")})},resetAriaGrid:function(e){var t=C.extend({header:!0,body:!0,pager:!0},e||{});return this.each(function(){t.body&&C(this).jqGrid("resetAriaBody"),t.header&&C(this).jqGrid("resetAriaHeader"),t.pager&&C(this).jqGrid("resetAriaPager")})}})});