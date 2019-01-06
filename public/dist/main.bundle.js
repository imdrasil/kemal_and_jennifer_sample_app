/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/dist";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


__webpack_require__(1);

document.addEventListener("DOMContentLoaded", function () {
  var elements = document.querySelectorAll("a[data-method='delete']");
  var i = void 0;
  for (i = 0; i < elements.length; i++) {
    elements[i].addEventListener("click", function (e) {
      e.preventDefault();
      var message = e.target.getAttribute("data-confirm") || "Are you sure?";
      if (confirm(message)) {
        var form = document.createElement("form"),
            input = document.createElement("input");
        var url = new URL(e.target.getAttribute("href"), location.origin);
        url.searchParams.set("_method", "DELETE");
        form.action = url.href;
        form.setAttribute("method", "POST");

        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
      }
      return false;
    });
  }
});

var removeAlert = function removeAlert(time) {
  var $alert = document.querySelector('.alert');
  if ($alert) {
    setTimeout(function () {
      $alert.remove();
    }, time);
  }
};

removeAlert(2000);

/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


window.HTTPMethodEmulator = {
  key: "_method",
  handler: function handler(form) {
    var method = form.querySelector("input[name='" + this.key + "']");

    if (method === null) return;
    var httpMethod = method.getAttribute("value").toUpperCase();

    if (httpMethod == "POST") return;

    var url = new URL(form.action, location.origin);
    url.searchParams.set(this.key, httpMethod);
    form.action = url.href;
  }
};

document.addEventListener("submit", function (e) {
  window.HTTPMethodEmulator.handler(e.target);
});

/***/ })
/******/ ]);
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly8vd2VicGFjay9ib290c3RyYXAgYzc1YWJkNDFhMDM4MDE2ZWEyNGEiLCJ3ZWJwYWNrOi8vLy4vc3JjL2Fzc2V0cy9qYXZhc2NyaXB0cy9tYWluLmpzIiwid2VicGFjazovLy8uL2xpYi9odHRwX21ldGhvZF9lbXVsYXRvci9hc3NldHMvaHR0cF9tZXRob2RfZW11bGF0b3IuanMiXSwibmFtZXMiOlsiZG9jdW1lbnQiLCJhZGRFdmVudExpc3RlbmVyIiwiZWxlbWVudHMiLCJxdWVyeVNlbGVjdG9yQWxsIiwiaSIsImxlbmd0aCIsImUiLCJwcmV2ZW50RGVmYXVsdCIsIm1lc3NhZ2UiLCJ0YXJnZXQiLCJnZXRBdHRyaWJ1dGUiLCJjb25maXJtIiwiZm9ybSIsImNyZWF0ZUVsZW1lbnQiLCJpbnB1dCIsInVybCIsIlVSTCIsImxvY2F0aW9uIiwib3JpZ2luIiwic2VhcmNoUGFyYW1zIiwic2V0IiwiYWN0aW9uIiwiaHJlZiIsInNldEF0dHJpYnV0ZSIsImFwcGVuZENoaWxkIiwiYm9keSIsInN1Ym1pdCIsInJlbW92ZUFsZXJ0IiwidGltZSIsIiRhbGVydCIsInF1ZXJ5U2VsZWN0b3IiLCJzZXRUaW1lb3V0IiwicmVtb3ZlIiwid2luZG93IiwiSFRUUE1ldGhvZEVtdWxhdG9yIiwia2V5IiwiaGFuZGxlciIsIm1ldGhvZCIsImh0dHBNZXRob2QiLCJ0b1VwcGVyQ2FzZSJdLCJtYXBwaW5ncyI6IjtBQUFBO0FBQ0E7O0FBRUE7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUFFQTtBQUNBOztBQUVBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBOzs7QUFHQTtBQUNBOztBQUVBO0FBQ0E7O0FBRUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxhQUFLO0FBQ0w7QUFDQTs7QUFFQTtBQUNBO0FBQ0E7QUFDQSxtQ0FBMkIsMEJBQTBCLEVBQUU7QUFDdkQseUNBQWlDLGVBQWU7QUFDaEQ7QUFDQTtBQUNBOztBQUVBO0FBQ0EsOERBQXNELCtEQUErRDs7QUFFckg7QUFDQTs7QUFFQTtBQUNBOzs7Ozs7Ozs7O0FDN0RBOztBQUVBQSxTQUFTQyxnQkFBVCxDQUEwQixrQkFBMUIsRUFBOEMsWUFBWTtBQUN4RCxNQUFNQyxXQUFXRixTQUFTRyxnQkFBVCxDQUEwQix5QkFBMUIsQ0FBakI7QUFDQSxNQUFJQyxVQUFKO0FBQ0EsT0FBS0EsSUFBSSxDQUFULEVBQVlBLElBQUlGLFNBQVNHLE1BQXpCLEVBQWlDRCxHQUFqQyxFQUFzQztBQUNwQ0YsYUFBU0UsQ0FBVCxFQUFZSCxnQkFBWixDQUE2QixPQUE3QixFQUFzQyxVQUFVSyxDQUFWLEVBQWE7QUFDakRBLFFBQUVDLGNBQUY7QUFDQSxVQUFNQyxVQUFVRixFQUFFRyxNQUFGLENBQVNDLFlBQVQsQ0FBc0IsY0FBdEIsS0FBeUMsZUFBekQ7QUFDQSxVQUFJQyxRQUFRSCxPQUFSLENBQUosRUFBc0I7QUFDcEIsWUFBTUksT0FBT1osU0FBU2EsYUFBVCxDQUF1QixNQUF2QixDQUFiO0FBQUEsWUFDRUMsUUFBUWQsU0FBU2EsYUFBVCxDQUF1QixPQUF2QixDQURWO0FBRUEsWUFBTUUsTUFBTSxJQUFJQyxHQUFKLENBQVFWLEVBQUVHLE1BQUYsQ0FBU0MsWUFBVCxDQUFzQixNQUF0QixDQUFSLEVBQXVDTyxTQUFTQyxNQUFoRCxDQUFaO0FBQ0FILFlBQUlJLFlBQUosQ0FBaUJDLEdBQWpCLENBQXFCLFNBQXJCLEVBQWdDLFFBQWhDO0FBQ0FSLGFBQUtTLE1BQUwsR0FBY04sSUFBSU8sSUFBbEI7QUFDQVYsYUFBS1csWUFBTCxDQUFrQixRQUFsQixFQUE0QixNQUE1Qjs7QUFFQVgsYUFBS1ksV0FBTCxDQUFpQlYsS0FBakI7QUFDQWQsaUJBQVN5QixJQUFULENBQWNELFdBQWQsQ0FBMEJaLElBQTFCO0FBQ0FBLGFBQUtjLE1BQUw7QUFDRDtBQUNELGFBQU8sS0FBUDtBQUNELEtBaEJEO0FBaUJEO0FBQ0YsQ0F0QkQ7O0FBd0JBLElBQU1DLGNBQWMsU0FBZEEsV0FBYyxDQUFDQyxJQUFELEVBQVU7QUFDNUIsTUFBTUMsU0FBUzdCLFNBQVM4QixhQUFULENBQXVCLFFBQXZCLENBQWY7QUFDQSxNQUFJRCxNQUFKLEVBQVk7QUFDVkUsZUFBVyxZQUFNO0FBQ2ZGLGFBQU9HLE1BQVA7QUFDRCxLQUZELEVBRUdKLElBRkg7QUFHRDtBQUNGLENBUEQ7O0FBU0FELFlBQVksSUFBWixFOzs7Ozs7Ozs7QUNuQ0FNLE9BQU9DLGtCQUFQLEdBQTRCO0FBQzFCQyxPQUFLLFNBRHFCO0FBRTFCQyxXQUFTLGlCQUFTeEIsSUFBVCxFQUFlO0FBQ3RCLFFBQUl5QixTQUFTekIsS0FBS2tCLGFBQUwsQ0FBbUIsaUJBQWlCLEtBQUtLLEdBQXRCLEdBQTRCLElBQS9DLENBQWI7O0FBRUEsUUFBSUUsV0FBVyxJQUFmLEVBQ0U7QUFDRixRQUFJQyxhQUFhRCxPQUFPM0IsWUFBUCxDQUFvQixPQUFwQixFQUE2QjZCLFdBQTdCLEVBQWpCOztBQUVBLFFBQUlELGNBQWMsTUFBbEIsRUFDRTs7QUFFRixRQUFJdkIsTUFBTSxJQUFJQyxHQUFKLENBQVFKLEtBQUtTLE1BQWIsRUFBcUJKLFNBQVNDLE1BQTlCLENBQVY7QUFDQUgsUUFBSUksWUFBSixDQUFpQkMsR0FBakIsQ0FBcUIsS0FBS2UsR0FBMUIsRUFBK0JHLFVBQS9CO0FBQ0ExQixTQUFLUyxNQUFMLEdBQWNOLElBQUlPLElBQWxCO0FBQ0Q7QUFmeUIsQ0FBNUI7O0FBa0JBdEIsU0FBU0MsZ0JBQVQsQ0FBMEIsUUFBMUIsRUFBb0MsVUFBVUssQ0FBVixFQUFhO0FBQy9DMkIsU0FBT0Msa0JBQVAsQ0FBMEJFLE9BQTFCLENBQWtDOUIsRUFBRUcsTUFBcEM7QUFDRCxDQUZELEUiLCJmaWxlIjoibWFpbi5idW5kbGUuanMiLCJzb3VyY2VzQ29udGVudCI6WyIgXHQvLyBUaGUgbW9kdWxlIGNhY2hlXG4gXHR2YXIgaW5zdGFsbGVkTW9kdWxlcyA9IHt9O1xuXG4gXHQvLyBUaGUgcmVxdWlyZSBmdW5jdGlvblxuIFx0ZnVuY3Rpb24gX193ZWJwYWNrX3JlcXVpcmVfXyhtb2R1bGVJZCkge1xuXG4gXHRcdC8vIENoZWNrIGlmIG1vZHVsZSBpcyBpbiBjYWNoZVxuIFx0XHRpZihpbnN0YWxsZWRNb2R1bGVzW21vZHVsZUlkXSkge1xuIFx0XHRcdHJldHVybiBpbnN0YWxsZWRNb2R1bGVzW21vZHVsZUlkXS5leHBvcnRzO1xuIFx0XHR9XG4gXHRcdC8vIENyZWF0ZSBhIG5ldyBtb2R1bGUgKGFuZCBwdXQgaXQgaW50byB0aGUgY2FjaGUpXG4gXHRcdHZhciBtb2R1bGUgPSBpbnN0YWxsZWRNb2R1bGVzW21vZHVsZUlkXSA9IHtcbiBcdFx0XHRpOiBtb2R1bGVJZCxcbiBcdFx0XHRsOiBmYWxzZSxcbiBcdFx0XHRleHBvcnRzOiB7fVxuIFx0XHR9O1xuXG4gXHRcdC8vIEV4ZWN1dGUgdGhlIG1vZHVsZSBmdW5jdGlvblxuIFx0XHRtb2R1bGVzW21vZHVsZUlkXS5jYWxsKG1vZHVsZS5leHBvcnRzLCBtb2R1bGUsIG1vZHVsZS5leHBvcnRzLCBfX3dlYnBhY2tfcmVxdWlyZV9fKTtcblxuIFx0XHQvLyBGbGFnIHRoZSBtb2R1bGUgYXMgbG9hZGVkXG4gXHRcdG1vZHVsZS5sID0gdHJ1ZTtcblxuIFx0XHQvLyBSZXR1cm4gdGhlIGV4cG9ydHMgb2YgdGhlIG1vZHVsZVxuIFx0XHRyZXR1cm4gbW9kdWxlLmV4cG9ydHM7XG4gXHR9XG5cblxuIFx0Ly8gZXhwb3NlIHRoZSBtb2R1bGVzIG9iamVjdCAoX193ZWJwYWNrX21vZHVsZXNfXylcbiBcdF9fd2VicGFja19yZXF1aXJlX18ubSA9IG1vZHVsZXM7XG5cbiBcdC8vIGV4cG9zZSB0aGUgbW9kdWxlIGNhY2hlXG4gXHRfX3dlYnBhY2tfcmVxdWlyZV9fLmMgPSBpbnN0YWxsZWRNb2R1bGVzO1xuXG4gXHQvLyBkZWZpbmUgZ2V0dGVyIGZ1bmN0aW9uIGZvciBoYXJtb255IGV4cG9ydHNcbiBcdF9fd2VicGFja19yZXF1aXJlX18uZCA9IGZ1bmN0aW9uKGV4cG9ydHMsIG5hbWUsIGdldHRlcikge1xuIFx0XHRpZighX193ZWJwYWNrX3JlcXVpcmVfXy5vKGV4cG9ydHMsIG5hbWUpKSB7XG4gXHRcdFx0T2JqZWN0LmRlZmluZVByb3BlcnR5KGV4cG9ydHMsIG5hbWUsIHtcbiBcdFx0XHRcdGNvbmZpZ3VyYWJsZTogZmFsc2UsXG4gXHRcdFx0XHRlbnVtZXJhYmxlOiB0cnVlLFxuIFx0XHRcdFx0Z2V0OiBnZXR0ZXJcbiBcdFx0XHR9KTtcbiBcdFx0fVxuIFx0fTtcblxuIFx0Ly8gZ2V0RGVmYXVsdEV4cG9ydCBmdW5jdGlvbiBmb3IgY29tcGF0aWJpbGl0eSB3aXRoIG5vbi1oYXJtb255IG1vZHVsZXNcbiBcdF9fd2VicGFja19yZXF1aXJlX18ubiA9IGZ1bmN0aW9uKG1vZHVsZSkge1xuIFx0XHR2YXIgZ2V0dGVyID0gbW9kdWxlICYmIG1vZHVsZS5fX2VzTW9kdWxlID9cbiBcdFx0XHRmdW5jdGlvbiBnZXREZWZhdWx0KCkgeyByZXR1cm4gbW9kdWxlWydkZWZhdWx0J107IH0gOlxuIFx0XHRcdGZ1bmN0aW9uIGdldE1vZHVsZUV4cG9ydHMoKSB7IHJldHVybiBtb2R1bGU7IH07XG4gXHRcdF9fd2VicGFja19yZXF1aXJlX18uZChnZXR0ZXIsICdhJywgZ2V0dGVyKTtcbiBcdFx0cmV0dXJuIGdldHRlcjtcbiBcdH07XG5cbiBcdC8vIE9iamVjdC5wcm90b3R5cGUuaGFzT3duUHJvcGVydHkuY2FsbFxuIFx0X193ZWJwYWNrX3JlcXVpcmVfXy5vID0gZnVuY3Rpb24ob2JqZWN0LCBwcm9wZXJ0eSkgeyByZXR1cm4gT2JqZWN0LnByb3RvdHlwZS5oYXNPd25Qcm9wZXJ0eS5jYWxsKG9iamVjdCwgcHJvcGVydHkpOyB9O1xuXG4gXHQvLyBfX3dlYnBhY2tfcHVibGljX3BhdGhfX1xuIFx0X193ZWJwYWNrX3JlcXVpcmVfXy5wID0gXCIvZGlzdFwiO1xuXG4gXHQvLyBMb2FkIGVudHJ5IG1vZHVsZSBhbmQgcmV0dXJuIGV4cG9ydHNcbiBcdHJldHVybiBfX3dlYnBhY2tfcmVxdWlyZV9fKF9fd2VicGFja19yZXF1aXJlX18ucyA9IDApO1xuXG5cblxuLy8gV0VCUEFDSyBGT09URVIgLy9cbi8vIHdlYnBhY2svYm9vdHN0cmFwIGM3NWFiZDQxYTAzODAxNmVhMjRhIiwiaW1wb3J0IFwiaHR0cF9tZXRob2RfZW11bGF0b3JcIjtcblxuZG9jdW1lbnQuYWRkRXZlbnRMaXN0ZW5lcihcIkRPTUNvbnRlbnRMb2FkZWRcIiwgZnVuY3Rpb24gKCkge1xuICBjb25zdCBlbGVtZW50cyA9IGRvY3VtZW50LnF1ZXJ5U2VsZWN0b3JBbGwoXCJhW2RhdGEtbWV0aG9kPSdkZWxldGUnXVwiKTtcbiAgbGV0IGk7XG4gIGZvciAoaSA9IDA7IGkgPCBlbGVtZW50cy5sZW5ndGg7IGkrKykge1xuICAgIGVsZW1lbnRzW2ldLmFkZEV2ZW50TGlzdGVuZXIoXCJjbGlja1wiLCBmdW5jdGlvbiAoZSkge1xuICAgICAgZS5wcmV2ZW50RGVmYXVsdCgpO1xuICAgICAgY29uc3QgbWVzc2FnZSA9IGUudGFyZ2V0LmdldEF0dHJpYnV0ZShcImRhdGEtY29uZmlybVwiKSB8fCBcIkFyZSB5b3Ugc3VyZT9cIjtcbiAgICAgIGlmIChjb25maXJtKG1lc3NhZ2UpKSB7XG4gICAgICAgIGNvbnN0IGZvcm0gPSBkb2N1bWVudC5jcmVhdGVFbGVtZW50KFwiZm9ybVwiKSxcbiAgICAgICAgICBpbnB1dCA9IGRvY3VtZW50LmNyZWF0ZUVsZW1lbnQoXCJpbnB1dFwiKTtcbiAgICAgICAgY29uc3QgdXJsID0gbmV3IFVSTChlLnRhcmdldC5nZXRBdHRyaWJ1dGUoXCJocmVmXCIpLCBsb2NhdGlvbi5vcmlnaW4pO1xuICAgICAgICB1cmwuc2VhcmNoUGFyYW1zLnNldChcIl9tZXRob2RcIiwgXCJERUxFVEVcIik7XG4gICAgICAgIGZvcm0uYWN0aW9uID0gdXJsLmhyZWY7XG4gICAgICAgIGZvcm0uc2V0QXR0cmlidXRlKFwibWV0aG9kXCIsIFwiUE9TVFwiKTtcblxuICAgICAgICBmb3JtLmFwcGVuZENoaWxkKGlucHV0KTtcbiAgICAgICAgZG9jdW1lbnQuYm9keS5hcHBlbmRDaGlsZChmb3JtKTtcbiAgICAgICAgZm9ybS5zdWJtaXQoKTtcbiAgICAgIH1cbiAgICAgIHJldHVybiBmYWxzZTtcbiAgICB9KVxuICB9XG59KTtcblxuY29uc3QgcmVtb3ZlQWxlcnQgPSAodGltZSkgPT4ge1xuICBjb25zdCAkYWxlcnQgPSBkb2N1bWVudC5xdWVyeVNlbGVjdG9yKCcuYWxlcnQnKVxuICBpZiAoJGFsZXJ0KSB7XG4gICAgc2V0VGltZW91dCgoKSA9PiB7XG4gICAgICAkYWxlcnQucmVtb3ZlKClcbiAgICB9LCB0aW1lKTtcbiAgfVxufVxuXG5yZW1vdmVBbGVydCgyMDAwKVxuXG5cblxuLy8gV0VCUEFDSyBGT09URVIgLy9cbi8vIC4vc3JjL2Fzc2V0cy9qYXZhc2NyaXB0cy9tYWluLmpzIiwid2luZG93LkhUVFBNZXRob2RFbXVsYXRvciA9IHtcbiAga2V5OiBcIl9tZXRob2RcIixcbiAgaGFuZGxlcjogZnVuY3Rpb24oZm9ybSkge1xuICAgIHZhciBtZXRob2QgPSBmb3JtLnF1ZXJ5U2VsZWN0b3IoXCJpbnB1dFtuYW1lPSdcIiArIHRoaXMua2V5ICsgXCInXVwiKTtcblxuICAgIGlmIChtZXRob2QgPT09IG51bGwpXG4gICAgICByZXR1cm47XG4gICAgdmFyIGh0dHBNZXRob2QgPSBtZXRob2QuZ2V0QXR0cmlidXRlKFwidmFsdWVcIikudG9VcHBlckNhc2UoKTtcblxuICAgIGlmIChodHRwTWV0aG9kID09IFwiUE9TVFwiKVxuICAgICAgcmV0dXJuO1xuXG4gICAgdmFyIHVybCA9IG5ldyBVUkwoZm9ybS5hY3Rpb24sIGxvY2F0aW9uLm9yaWdpbik7XG4gICAgdXJsLnNlYXJjaFBhcmFtcy5zZXQodGhpcy5rZXksIGh0dHBNZXRob2QpO1xuICAgIGZvcm0uYWN0aW9uID0gdXJsLmhyZWY7XG4gIH1cbn1cblxuZG9jdW1lbnQuYWRkRXZlbnRMaXN0ZW5lcihcInN1Ym1pdFwiLCBmdW5jdGlvbiAoZSkge1xuICB3aW5kb3cuSFRUUE1ldGhvZEVtdWxhdG9yLmhhbmRsZXIoZS50YXJnZXQpO1xufSk7XG5cblxuXG4vLyBXRUJQQUNLIEZPT1RFUiAvL1xuLy8gLi9saWIvaHR0cF9tZXRob2RfZW11bGF0b3IvYXNzZXRzL2h0dHBfbWV0aG9kX2VtdWxhdG9yLmpzIl0sInNvdXJjZVJvb3QiOiIifQ==