var c=Object.defineProperty;var r=Object.getOwnPropertyDescriptor;var m=Object.getOwnPropertyNames;var A=Object.prototype.hasOwnProperty;var u=(i,e)=>{for(var l in e)c(i,l,{get:e[l],enumerable:!0})},y=(i,e,l,s)=>{if(e&&typeof e=="object"||typeof e=="function")for(let o of m(e))!A.call(i,o)&&o!==l&&c(i,o,{get:()=>e[o],enumerable:!(s=r(e,o))||s.enumerable});return i};var d=i=>y(c({},"__esModule",{value:!0}),i);var p={};u(p,{default:()=>a});module.exports=d(p);var t=require("@raycast/api"),n=require("react/jsx-runtime");function a(){return(0,n.jsx)(t.List,{children:(0,n.jsx)(t.List.EmptyView,{title:"Reset TempMail Back to Defaults?",description:"If you encounter errors, execute this command to reset the extension back to defaults",icon:{source:t.Icon.RewindFilled},actions:(0,n.jsx)(t.ActionPanel,{children:(0,n.jsx)(t.Action,{title:"Reset",onAction:()=>(0,t.confirmAlert)({title:"Reset TempMail",message:"All your current messages will be lost",primaryAction:{title:"Reset",style:t.Alert.ActionStyle.Destructive,onAction:async()=>{await t.LocalStorage.clear()}},dismissAction:{title:"Cancel",style:t.Alert.ActionStyle.Cancel}})})})})})}