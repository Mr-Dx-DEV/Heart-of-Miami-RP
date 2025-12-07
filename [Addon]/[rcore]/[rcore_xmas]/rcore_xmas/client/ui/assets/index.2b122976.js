import{c as Ie}from"./@react-dom.b05160d9.js";import{r as a,d as b,l as k,j as p,a as t,F as ie,R as ce,t as Pe,c as Be,b as He,G as re,X as $e,M as se,S as Ve}from"./vendor.1a06411d.js";import{$ as Ue}from"./@radix-ui.d7ae82a9.js";(function(){const n=document.createElement("link").relList;if(n&&n.supports&&n.supports("modulepreload"))return;for(const l of document.querySelectorAll('link[rel="modulepreload"]'))o(l);new MutationObserver(l=>{for(const r of l)if(r.type==="childList")for(const c of r.addedNodes)c.tagName==="LINK"&&c.rel==="modulepreload"&&o(c)}).observe(document,{childList:!0,subtree:!0});function i(l){const r={};return l.integrity&&(r.integrity=l.integrity),l.referrerpolicy&&(r.referrerPolicy=l.referrerpolicy),l.crossorigin==="use-credentials"?r.credentials="include":l.crossorigin==="anonymous"?r.credentials="omit":r.credentials="same-origin",r}function o(l){if(l.ep)return;l.ep=!0;const r=i(l);fetch(l.href,r)}})();const je=()=>!window.invokeNative,We=()=>{},S=(e,n)=>{const i=a.exports.useRef(We);a.exports.useEffect(()=>{i.current=n},[n]),a.exports.useEffect(()=>{const o=l=>{const{action:r,data:c}=l.data;i.current&&r===e&&i.current(c)};return window.addEventListener("message",o),()=>window.removeEventListener("message",o)},[e])};async function Ze(){const n=await(await fetch("config.js")).text(),i=new Blob([n],{type:"text/javascript"}),o=URL.createObjectURL(i),l=document.createElement("script");return l.src=o,new Promise(r=>{l.onload=()=>{URL.revokeObjectURL(o),r(window.appConfig)},document.head.appendChild(l)})}const ze=b.div`
  display: flex;
  position: absolute;
  background-color: rgba(0, 0, 0, 0.7);
  font-family: Montserrat, 'Trebuchet MS';
  font-weight: 500;
  font-size: 14px;
  padding: 12px;
  color: white;
  gap: 10px 15px;
  z-index: 999999999;
  max-width: ${({maxWidth:e})=>`${e||300}px`};

  ${({position:e})=>{switch(e){case"top-left":return k`
          top: 0;
          left: 0;
        `;case"top-right":return k`
          top: 0;
          right: 0;
        `;case"bottom-left":return k`
          bottom: 0;
          left: 0;
        `;case"bottom-right":return k`
          bottom: 0;
          right: 0;
        `;default:return k`
          top: 0;
          left: 0;
        `}}}
  margin: ${({marginVertical:e,marginHorizontal:n})=>`${e||0} ${n||0}`};
  flex-direction: ${({asColumn:e})=>e?"column":"row"};

  svg {
    width: 24px;
  }
`,Ge=b.div`
  display: flex;
  align-items: center;
  gap: 12px;

  div {
    display: flex;
    gap: 3px;
  }
`,Ke=b.span`
  display: inline-block;
`,M=b.kbd`
  display: inline-block;
  color: black;
  background-color: white;
  font-weight: 600;
  padding: ${({isBiggerFont:e})=>e?"2px 8px":"5px 10px"};
  border-radius: 5px;
  font-family: Montserrat, 'Trebuchet MS';
  font-size: ${({isBiggerFont:e})=>e?"18px":"inherit"};
`,Fe=()=>p("svg",{xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 143 152",children:[t("path",{d:"m131.24 62.16-23.89-1-6.7-2.54 16.74-2.88"}),t("path",{d:"M0 22.3v85.52c0 2.83.47 5.64 1.44 8.31 3.89 10.77 16.77 36.24 51.43 36.01 35.64-.23 48.62-27.43 52.25-37.7.79-2.23 1.18-4.56 1.18-6.92V25.46c0-1.68-.64-3.29-1.82-4.53C100.43 16.66 89 7.06 64.34 1.42a55.729 55.729 0 0 0-23.11-.4C30.2 3.19 13.68 7.81 2.34 17.26A6.536 6.536 0 0 0 0 22.29Z"}),t("path",{fill:"#fff",d:"M6.43 26.58v77.79c0 2.57.41 5.13 1.26 7.56 3.41 9.79 14.69 32.97 45.04 32.76 31.21-.21 42.58-24.95 45.77-34.29.69-2.03 1.04-4.15 1.04-6.29V29.47c0-1.53-.56-3-1.59-4.12C94.4 21.47 84.39 12.73 62.79 7.6c-6.64-1.58-13.55-1.72-20.24-.36-9.66 1.97-24.14 6.18-34.06 14.77-1.32 1.14-2.05 2.83-2.05 4.58Z"}),t("ellipse",{cx:"52.57",cy:"53.98",rx:"6.87",ry:"16.63"}),t("path",{fill:"#bcbcbc",d:"M54.78 15.04v12.69s12.69 1.93 10.48 25.38l.26 9.93h24.85V32.57c0-3.8-1.8-7.38-4.87-9.63-4.86-3.57-14.09-7.74-30.72-7.9Zm-4.59 0v12.69S37.5 29.66 39.71 53.11l-.26 9.93H14.61V32.57c0-3.8 1.8-7.38 4.87-9.63 4.86-3.57 14.09-7.74 30.72-7.9Z"}),t("path",{d:"M120.28 115.13h10.96V62.16h11.78l-16.43-24.81-14 23.6 7.69 1v53.18z"}),t("path",{d:"m116.96 68-4.61 41.04 7.93 6.09h3.11m-4.74-81.3 7.94 3.52-1 8.43"}),t("path",{fill:"#fff",d:"M112.35 109.04h10.95V57.82h11.79l-16.44-23.99-17 23.79h10.7v51.42z"})]}),Je=()=>p("svg",{xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 143 152",children:[t("path",{d:"M0 22.3v85.52c0 2.83.47 5.64 1.44 8.31 3.89 10.77 16.77 36.24 51.43 36.01 35.64-.23 48.62-27.43 52.25-37.7.79-2.23 1.18-4.56 1.18-6.92V25.46c0-1.68-.64-3.29-1.82-4.53C100.43 16.66 89 7.06 64.34 1.42a55.729 55.729 0 0 0-23.11-.4C30.2 3.19 13.68 7.81 2.34 17.26A6.536 6.536 0 0 0 0 22.29Z"}),t("path",{fill:"#fff",d:"M6.43 26.58v77.79c0 2.57.41 5.13 1.26 7.56 3.41 9.79 14.69 32.97 45.04 32.76 31.21-.21 42.58-24.95 45.77-34.29.69-2.03 1.04-4.15 1.04-6.29V29.47c0-1.53-.56-3-1.59-4.12C94.4 21.47 84.39 12.73 62.79 7.6c-6.64-1.58-13.55-1.72-20.24-.36-9.66 1.97-24.14 6.18-34.06 14.77-1.32 1.14-2.05 2.83-2.05 4.58Z"}),t("ellipse",{cx:"52.57",cy:"53.98",rx:"6.87",ry:"16.63"}),t("path",{fill:"#bcbcbc",d:"M54.78 15.04v12.69s12.69 1.93 10.48 25.38l.26 9.93h24.85V32.57c0-3.8-1.8-7.38-4.87-9.63-4.86-3.57-14.09-7.74-30.72-7.9ZM50.19 15.04v12.69S37.5 29.66 39.71 53.11l-.26 9.93H14.61V32.57c0-3.8 1.8-7.38 4.87-9.63 4.86-3.57 14.09-7.74 30.72-7.9Z"}),t("path",{d:"m131.89 82.56-23.89 1-6.7 2.55 16.74 2.88"}),t("path",{d:"M120.93 29.6h10.96v52.96h11.78l-16.43 24.82-14-23.6 7.69-1V29.6z"}),t("path",{d:"M117.61 76.73 113 35.68l7.93-6.08h3.11M119.3 110.9l7.94-3.52-1-8.44"}),t("path",{fill:"#fff",d:"M113 35.68h10.96V86.9h11.78l-16.44 24-17-23.79H113V35.68z"})]}),Ye=()=>p("svg",{xmlns:"http://www.w3.org/2000/svg","data-name":"Vrstva 1",viewBox:"0 0 106.3 152.14",children:[t("path",{d:"M0 22.3v85.52c0 2.83.47 5.64 1.44 8.31 3.89 10.77 16.77 36.24 51.43 36.01 35.64-.23 48.62-27.43 52.25-37.7.79-2.23 1.18-4.56 1.18-6.92V25.46c0-1.68-.64-3.29-1.82-4.53C100.43 16.66 89 7.06 64.34 1.42a55.729 55.729 0 0 0-23.11-.4C30.2 3.19 13.68 7.81 2.34 17.26A6.536 6.536 0 0 0 0 22.29Z"}),t("path",{d:"M6.43 26.58v77.79c0 2.57.41 5.13 1.26 7.56 3.41 9.79 14.69 32.97 45.04 32.76s42.58-24.95 45.77-34.29c.69-2.03 1.04-4.15 1.04-6.29V29.47c0-1.53-.56-3-1.59-4.12C94.4 21.47 84.39 12.73 62.79 7.6c-6.64-1.58-13.55-1.72-20.24-.36-9.66 1.97-24.14 6.18-34.06 14.77-1.32 1.14-2.05 2.83-2.05 4.58Z",fill:"#fff"}),t("ellipse",{cx:"52.57",cy:"53.98",rx:"6.87",ry:"16.63"}),t("path",{d:"M54.78 15.04v12.69s12.69 1.93 10.48 25.38l.26 9.93h24.85V32.57c0-3.8-1.8-7.38-4.87-9.63-4.86-3.57-14.09-7.74-30.72-7.9Z",fill:"#bcbcbc"}),t("path",{d:"M50.19 15.04v12.69S37.5 29.66 39.71 53.11l-.26 9.93H14.61V32.57c0-3.8 1.8-7.38 4.87-9.63 4.86-3.57 14.09-7.74 30.72-7.9Z"})]}),Xe=()=>p("svg",{xmlns:"http://www.w3.org/2000/svg","data-name":"Vrstva 1",viewBox:"0 0 106.3 152.14",children:[t("path",{d:"M0 22.3v85.52c0 2.83.47 5.64 1.44 8.31 3.89 10.77 16.77 36.24 51.43 36.01 35.64-.23 48.62-27.43 52.25-37.7.79-2.23 1.18-4.56 1.18-6.92V25.46c0-1.68-.64-3.29-1.82-4.53C100.43 16.66 89 7.06 64.34 1.42a55.729 55.729 0 0 0-23.11-.4C30.2 3.19 13.68 7.81 2.34 17.26A6.536 6.536 0 0 0 0 22.29Z"}),t("path",{d:"M6.43 26.58v77.79c0 2.57.41 5.13 1.26 7.56 3.41 9.79 14.69 32.97 45.04 32.76s42.58-24.95 45.77-34.29c.69-2.03 1.04-4.15 1.04-6.29V29.47c0-1.53-.56-3-1.59-4.12C94.4 21.47 84.39 12.73 62.79 7.6c-6.64-1.58-13.55-1.72-20.24-.36-9.66 1.97-24.14 6.18-34.06 14.77-1.32 1.14-2.05 2.83-2.05 4.58Z",fill:"#fff"}),t("ellipse",{cx:"52.57",cy:"53.98",rx:"6.87",ry:"16.63"}),t("path",{d:"M54.78 15.04v12.69s12.69 1.93 10.48 25.38l.26 9.93h24.85V32.57c0-3.8-1.8-7.38-4.87-9.63-4.86-3.57-14.09-7.74-30.72-7.9Z"}),t("path",{d:"M50.19 15.04v12.69S37.5 29.66 39.71 53.11l-.26 9.93H14.61V32.57c0-3.8 1.8-7.38 4.87-9.63 4.86-3.57 14.09-7.74 30.72-7.9Z",fill:"#bcbcbc"})]}),me={WheelUp:t(Fe,{}),WheelDown:t(Je,{}),ArrowUp:t(M,{isBiggerFont:!0,children:"\u2191"}),ArrowDown:t(M,{isBiggerFont:!0,children:"\u2193"}),ArrowLeft:t(M,{isBiggerFont:!0,children:"\u2190"}),ArrowRight:t(M,{isBiggerFont:!0,children:"\u2192"}),Enter:t(M,{isBiggerFont:!0,children:"\u21B5"}),Escape:t(M,{children:"Esc"}),MouseLMB:t(Ye,{}),MouseRMB:t(Xe,{})},qe=({visible:e,helpKeys:n,position:i,marginVertical:o,marginHorizontal:l,asColumn:r,maxWidth:c})=>{const f=m=>m===void 0?null:me[m]?me[m]:t(M,{children:m}),h=(m,x,N)=>{let g;return x instanceof Array?g=t("div",{children:x.map(E=>f(E))}):g=f(x),p(Ge,{children:[g,t(Ke,{children:N})]},m)},w=()=>n?(n=Object.fromEntries(Object.entries(n).sort(([,m],[,x])=>m.label.localeCompare(x.label))),Object.entries(n).map(([m,x])=>h(m,x.keyName,x.label))):[];return e&&n&&Object.entries(n).length?t(ze,{position:i,asColumn:r,marginVertical:o,marginHorizontal:l,maxWidth:c,children:w()}):null},Qe=()=>{const[e,n]=a.exports.useState({});return S("reactHelpKeysDisplay",o=>{n(o)}),e!=null&&e.helpKeys?t(qe,{visible:e==null?void 0:e.visible,helpKeys:e==null?void 0:e.helpKeys,position:e==null?void 0:e.position,marginVertical:e==null?void 0:e.marginVertical,marginHorizontal:e==null?void 0:e.marginHorizontal,asColumn:e==null?void 0:e.asColumn,maxWidth:e==null?void 0:e.maxWidth}):null},K=b.span`
	width: ${({width:e})=>e!==void 0?`${e}%`:"48%"};
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
`,F=b.span`
	width: ${({width:e})=>e!==void 0?`${e}%`:"48%"};
	display: flex;
	justify-content: flex-end;

	svg {
		width: 40px;
	}
`,Ee=b.span`
	width: ${({maxWidth:e})=>e?`${e}%`:"unset"};
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
`,D=b.div`
	background: ${({isFocused:e})=>e?"linear-gradient(90deg, rgba(255,255,255,1) 0%, rgba(255,255,255,1) 51%, rgba(199,201,200,1) 100%);":"transparent"};
	display: flex;
	align-items: center;
	gap: 20px;
	padding: 8px 10px;
	width: 100%;
	color: ${({isDisabled:e,isFocused:n})=>e&&n?"rgba(76, 76, 76, 0.5)":e?"rgba(255, 255, 255, 0.45)":n?"black":"inherit"};
	font-family:
		Open Sans,
		"Trebuchet MS";
	font-weight: 600;
	height: 38px;
	pointer-events: ${({noHover:e})=>e?"none":"auto"};

	&:hover {
		${({isFocused:e,noHover:n})=>!e&&!n&&"background: rgba(255, 255, 255, 0.1);"}
	}
`,et=b.div`
  position: absolute;
  margin: 30px;
  width: 384px;
  max-width: 384px;
  display: ${({isVisible:e})=>e?"block":"none"};
  user-select: none;
  text-align: left;

  ${({position:e})=>{switch(e){case"top-left":return k`
          top: 0;
          left: 0;
        `;case"top-right":return k`
          top: 0;
          right: 0;
        `;case"bottom-left":return k`
          bottom: 0;
          left: 0;
        `;case"bottom-right":return k`
          bottom: 0;
          right: 0;
        `;default:return k`
          top: 0;
          left: 0;
        `}}}

  * {
    box-sizing: border-box;
  }
`,J=b.div`
  background: rgba(0, 0, 0, 0.7);
`,tt=b(J)`
  display: block;
  color: white;
  max-height: ${({maxRowsInView:e})=>e?`calc(38px * ${e})`:"calc(38px * 5)"};
  min-height: ${({maxRowsInView:e})=>e?`calc(38px * ${e})`:"calc(38px * 5)"};
  overflow-y: hidden;
`,nt=b(J)`
  margin: 3px 0;
  color: white;
  font-weight: 400 !important;
  white-space: pre-line;

  ${D} {
    min-height: 22px;
    height: unset;
    display: block;
    line-height: 26px;

    ul {
      margin: 0;
      padding-inline-start: 20px;
    }

    li {
      font-weight: 300;
    }
  }
`,rt=b(J)`
  text-transform: uppercase;
  color: ${({accentColor:e})=>e||"white"};
  border-top: ${({accentColor:e,hasBorder:n})=>n?`3px solid ${e||"white"}`:"none"};
`,st=b(J)`
  background-image: url(${({backgroundImg:e})=>e});
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  background-color: ${({accentColor:e})=>e||"rgba(0, 0, 0, 0.7)"};
  width: 100%;
  height: 100px;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  font-size: 55px;
  line-height: 55px;
  color: ${({headerTextColor:e})=>e||"white"};
  /* text-shadow: -2px 2px 0 rgba(0, 0, 0, 0.5), 2px 2px 0 rgba(0, 0, 0, 0.5), 2px -2px 0 rgba(0, 0, 0, 0.5),
    -2px -2px 0 rgba(0, 0, 0, 0.5); */
  overflow: hidden;
  font-style: italic;
  font-family: SignPainter, Open Sans, 'Trebuchet MS'; // Needs to be imported to app

  span {
    margin-top: 10px;
  }
`,ot=b.span`
  display: flex;
  align-items: center;

  svg {
    width: 40px;
  }
`,it=b.div`
  appearance: none;
`,U=()=>t("svg",{xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 100 100",fill:"currentColor",xmlSpace:"preserve",children:t("path",{fill:"currentColor",d:"M73 50c0-12.7-10.3-23-23-23S27 37.3 27 50m3.9 0c0-10.5 8.5-19.1 19.1-19.1S69.1 39.5 69.1 50",children:t("animateTransform",{attributeName:"transform",attributeType:"XML",type:"rotate",dur:"1s",from:"0 50 50",to:"360 50 50",repeatCount:"indefinite"})})}),ct=a.exports.forwardRef(({title:e,onClick:n,value:i,isFocused:o,isLoading:l,isDisabled:r,onFocus:c},f)=>(a.exports.useEffect(()=>{o&&c&&c()},[o]),p(D,{ref:f,isFocused:o,isDisabled:r,onClick:n,children:[t(K,{children:t(it,{children:e})}),t(F,{children:l?t(U,{}):i})]}))),lt=b.span`
  display: flex;
  opacity: ${({isDisabled:e})=>e?"0.4":"1"};
  position: relative;
`,at=b.input`
  height: 20px;
  width: 20px;
  appearance: none;
  border: 2px solid ${({isFocused:e})=>e?"black":"white"};
  background: transparent;
  margin: 0;

  &:checked {
    background-color: ${({isFocused:e})=>e?"black":"white"};
    border: 2px solid ${({isFocused:e})=>e?"black":"white"};
  }
`,dt=b.span`
  display: flex;
  color: ${({isFocused:e})=>e?"white":"black"};
  position: absolute;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100%;
  padding: 3px;
`,ut=()=>t("svg",{xmlns:"http://www.w3.org/2000/svg",fill:"currentColor",viewBox:"0 0 24 24",children:t("path",{d:"M20.285 2 9 13.567 3.714 8.556 0 12.272 9 21 24 5.715z"})}),pt=a.exports.forwardRef(({title:e,isChecked:n,isFocused:i,isDisabled:o,isLoading:l,onClick:r,onFocus:c},f)=>(a.exports.useEffect(()=>{i&&c&&c()},[i]),p(D,{ref:f,isFocused:i,isDisabled:o,onClick:r,children:[t(K,{children:e}),t(F,{children:l?t(U,{}):p(lt,{isDisabled:o,children:[t(at,{isFocused:i,type:"checkbox",checked:n,onChange:()=>{}}),n&&t(dt,{isFocused:i,children:t(ut,{})})]})})]}))),we=b.span`
  font-weight: ${({isEnabled:e})=>e?700:400};
  opacity: ${({isEnabled:e})=>e?1:.2};
`,ht=a.exports.forwardRef(({title:e,selectedOptionLabel:n,isFocused:i,onFocus:o,isArrowsEnabled:l,isDisabled:r,isLoading:c,onClick:f},h)=>(a.exports.useEffect(()=>{i&&o&&o()},[i]),p(D,{ref:h,isFocused:i,isDisabled:r,onClick:f,onFocus:o,children:[p(K,{children:[e,": "]}),t(F,{children:c?t(U,{}):p(ie,{children:[t(we,{isEnabled:l,children:"<"}),t(Ee,{children:n}),t(we,{isEnabled:l,children:">"})]})})]}))),I=(e,n)=>{const i=a.exports.useRef(!1),o=a.exports.useRef();return a.exports.useMemo(()=>(...r)=>{i.current||(e(...r),i.current=!0,o.current=setTimeout(()=>{i.current=!1},n))},[e,n])},ft=b.div`
  width: 100%;
  height: 100%;
  position: fixed;
  display: flex;
  justify-content: center;
  align-items: center;
  top: 0;
  left: 0;
  font-family: Open Sans, 'Trebuchet MS';
  color: white;
  user-select: none;
  text-align: left;

  * {
    box-sizing: border-box;
  }
`,xt=b.span`
  font-weight: 600;
`,gt=b.div`
  background: rgba(0, 0, 0, 0.7);
  position: absolute;
  z-index: 999999;
  width: 60vw;
  padding: 15px;
  display: flex;
  flex-direction: column;
  gap: 10px;
`,bt=b.input`
  background: black;
  border: 1px solid #888888;
  color: white;
  padding: 5px 30px 5px 5px;
  font-size: 16px;

  &:focus {
    outline: none;
  }
`,mt=({title:e,isVisible:n,value:i,onChange:o})=>{const l=a.exports.useRef(null);return n?t(ft,{children:p(gt,{children:[p(xt,{children:[e,": "]}),t(bt,{ref:l,type:"text",value:i,onChange:c=>{o(c.target.value)},autoFocus:!0})]})}):null},oe=a.exports.forwardRef(({title:e,value:n,isFocused:i,isDisabled:o,noHover:l,columnSizes:r,isLoading:c,onClick:f,onFocus:h},w)=>{const m=()=>{const N=r==null?void 0:r[0];return N||!!n?N:100},x=()=>{const N=r==null?void 0:r[1];return N||!!n?N:0};return a.exports.useEffect(()=>{i&&h&&h()},[i]),p(D,{ref:w,noHover:l,isFocused:i,isDisabled:o,onClick:f,children:[t(K,{width:m(),children:e}),t(F,{width:x(),children:c?t(U,{}):t(Ee,{children:n})})]})}),wt=()=>t("svg",{xmlns:"http://www.w3.org/2000/svg",fill:"currentColor",viewBox:"0 0 24 24",children:t("g",{transform:"rotate(-90 12 12)",children:t("path",{d:"M8.122 24 4 20l8-8-8-8 4.122-4L20 12z"})})}),vt=b.div`
  background: rgba(0, 0, 0, 0.7);
  margin-top: 3px;
  color: white;
  display: flex;
  flex-direction: column;

  svg {
    width: 20px;
    height: 18px;
  }
`,ve=b.button`
  all: unset;
  height: 18px;
  width: 100%;
  display: flex;
  justify-content: center;

  &:hover {
    background: rgba(255, 255, 255, 0.1);
  }
`,yt=()=>t("svg",{xmlns:"http://www.w3.org/2000/svg",fill:"currentColor",viewBox:"0 0 24 24",children:t("g",{transform:"rotate(90 12 12)",children:t("path",{d:"M8.122 24 4 20l8-8-8-8 4.122-4L20 12z"})})}),Et=({onClickPrev:e,onClickNext:n})=>p(vt,{children:[t(ve,{onClick:e,children:t(wt,{})}),t(ve,{onClick:n,children:t(yt,{})})]});var V=(e=>(e.button="button",e.checkbox="checkbox",e.select="select",e.info="info",e.input="input",e.spacer="spacer",e))(V||{});async function j(e,n,i){const o={method:"post",headers:{"Content-Type":"application/json; charset=UTF-8"},body:JSON.stringify(n)};if(je()&&i)return i;const l=window.GetParentResourceName?window.GetParentResourceName():"rcore_xmas";return await(await fetch(`https://${l}/${e}`,o)).json()}const Nt=a.exports.forwardRef(({isFocused:e,onFocus:n,isDisabled:i,onClick:o},l)=>t(D,{ref:l,isFocused:!1,isDisabled:!0,noHover:!0,onClick:void 0,onFocus:void 0,children:t("div",{className:"w-full h-[2px] bg-gray-300"})})),ye=100,G=250,Ct=500,Rt=({rows:e,header:n,headerTextColor:i,headerImg:o,title:l="",accentColor:r,onRowFocus:c,maxRowsInView:f=5,isOpened:h,loading:w,loadingLabel:m,position:x,onInputVisibleChange:N,onButtonClick:g,onDataChange:E})=>{const C=()=>{const s=e.findIndex(u=>u.type!=="spacer");return s>=0?s:0},[d,L]=a.exports.useState({index:C(),type:e[C()].type}),[O,y]=a.exports.useState(!1),[T,Z]=a.exports.useState(),_=a.exports.useRef(e.map(()=>ce.createRef())),ae=Math.min(Math.max(1,f),e.length),Se=()=>e.map((s,u)=>{switch(s.type){case"button":const v=s;return t(ct,{ref:_.current[u],isFocused:d.index===u,title:v.title,isDisabled:v.isDisabled,onClick:()=>R("button",u),isLoading:s.isLoading,value:v.value,onFocus:()=>c==null?void 0:c(s.id)},s.id);case"checkbox":const ee=s;return t(pt,{ref:_.current[u],isFocused:d.index===u,title:ee.title,name:s.id,isChecked:ee.isChecked,isDisabled:ee.isDisabled,onClick:()=>R("checkbox",u),isLoading:s.isLoading,onFocus:()=>c==null?void 0:c(s.id)},s.id);case"select":const z=s;return t(ht,{ref:_.current[u],isFocused:d.index===u,title:z.title,name:s.id,selectedOptionLabel:z.selectedOption.label,isArrowsEnabled:d.index===u&&z.options.length>1,isDisabled:z.isDisabled,onClick:()=>R("select",u),isLoading:s.isLoading,onFocus:()=>c==null?void 0:c(s.id)},s.id);case"info":const te=s;return t(oe,{ref:_.current[u],isFocused:d.index===u,title:te.title,value:te.value,onClick:()=>R("info",u),isLoading:s.isLoading,isDisabled:te.isDisabled,onFocus:()=>c==null?void 0:c(s.id)},s.id);case"input":const ne=s;return t(oe,{ref:_.current[u],isFocused:d.index===u,title:ne.title,value:ne.value,onClick:()=>R("input",u),isLoading:s.isLoading,isDisabled:ne.isDisabled,onFocus:()=>c==null?void 0:c(s.id)},s.id);case"spacer":return t(Nt,{noHover:!0,title:"",isFocused:!1,isDisabled:!0},s.id);default:return null}}),[A,Y]=a.exports.useState(h),[P,ke]=a.exports.useState(!1),[de,ue]=a.exports.useState(""),[Le,pe]=a.exports.useState(""),he=s=>{ke(s),N==null||N(s),j("setCursorVisible",s)};a.exports.useEffect(()=>{var s;(s=_.current[d.index].current)==null||s.scrollIntoView({behavior:"smooth",block:"nearest",inline:"start"})},[d.index]);const B=()=>e[d.index].id,X=(s,u)=>{let v=s;do u==="next"?v=v<e.length-1?v+1:0:v=v>0?v-1:e.length-1;while(e[v].type==="spacer"&&v!==s);return v},H=I(()=>{const s=X(d.index,"next");L({index:s,type:e[s].type})},ye),$=I(()=>{const s=X(d.index,"prev");L({index:s,type:e[s].type})},ye),Te=I(()=>{const s=e[d.index];if(s.isDisabled||!A)return;const u=s.options.findIndex(v=>v.value===s.selectedOption.value);E(B(),V.select,s.options[u>0?u-1:s.options.length-1])},G),fe=I(()=>{const s=e[d.index];if(s.isDisabled||!A)return;const u=s.options.findIndex(v=>v.value===s.selectedOption.value);E(B(),V.select,s.options[(u+1)%s.options.length])},G),De=I(()=>{const s=e[d.index];s.isDisabled||!A||E(B(),V.checkbox,!s.isChecked)},G),Ae=I(()=>{e[d.index].isDisabled||!A||g==null||g(B())},G),Me=()=>{const s=e[d.index];s.isDisabled||!A||(pe(s.inputTitle),ue(s.value||""),Y(!1),he(!0))},xe=s=>{e[d.index].isDisabled||A||(pe(""),he(!1),Y(!0),s||E(B(),V.input,de))},Oe=s=>{ue(s)},R=(s,u)=>{if(u!==void 0&&d.index!==u){if(e[u].type==="spacer"){const v=X(u,"next");L({index:v,type:e[v].type});return}L({index:u,type:e[u].type});return}if(!(e[d.index].isLoading&&!e[d.index].ignoreLoading))switch(s){case"button":Ae();break;case"checkbox":De();break;case"select":fe();break;case"selectNext":fe();break;case"selectPrev":Te();break;case"input":P?xe():Me();break;case"inputClose":P&&xe(!0)}},q=a.exports.useCallback(s=>{var u;if(!w)switch((u=s.key)==null?void 0:u.toUpperCase()){case"ARROWUP":!P&&$();break;case"ARROWDOWN":!P&&H();break;case"ARROWLEFT":d.type==="select"&&R("selectPrev");break;case"ARROWRIGHT":d.type==="select"&&R("selectNext");break;case"ENTER":if(d.type==="checkbox"){R("checkbox");break}if(d.type==="button"){R("button");break}d.type==="select"&&R("button"),d.type==="input"&&R("input");break;case"ESCAPE":d.type==="input"&&R("inputClose")}},[$,H,R]),_e=ae<Object.keys(e).length,Q=a.exports.useCallback(s=>{s.deltaY<0&&$(),s.deltaY>0&&H()},[$,H]),ge=()=>{var u;const s=e[d.index];if(!s.isDisabled&&(u=s==null?void 0:s.selectedOption)!=null&&u.description)return s.selectedOption.description};a.exports.useEffect(()=>(window.addEventListener("keydown",q),window.addEventListener("wheel",Q),()=>{window.removeEventListener("keydown",q),window.removeEventListener("wheel",Q)}),[q,Q]),a.exports.useEffect(()=>{Y(h)},[h]),a.exports.useEffect(()=>{if(w){const s=setTimeout(()=>{w&&y(!0)},Ct);Z(s)}else clearTimeout(T),y(!1);return()=>clearTimeout(T)},[w]);const be=()=>e[d.index]?t(nt,{children:O&&m?t(D,{noHover:!0,children:m}):e[d.index].description&&p(D,{noHover:!0,children:[e[d.index].description,ge()&&p(ie,{children:[t("br",{}),t("ul",{children:t("li",{children:ge()})})]})]})}):(console.log("no focused row"),console.log(JSON.stringify(e)),console.log(d),console.log(d.index),null);return p(ie,{children:[p(et,{isVisible:A,position:x,children:[["bottom-left","bottom-right"].includes(x)&&be(),n!==void 0&&t(st,{backgroundImg:o,accentColor:r,headerTextColor:i,children:t("span",{children:n})}),l!==!1&&t(rt,{accentColor:r,hasBorder:!n,children:t(oe,{noHover:!0,isFocused:!1,title:`${l}`,value:p(ot,{children:[O&&t(U,{}),d.index+1,"/",e.length]}),columnSizes:[80,20]})}),t(tt,{maxRowsInView:ae,children:Se()}),_e&&t(Et,{onClickNext:H,onClickPrev:$}),["top-left","top-right"].includes(x)&&be()]}),t(mt,{title:Le,isVisible:P,value:de,onChange:Oe})]})},St=ce.memo(Rt),W=(e,n,i,o)=>j(e,{menuId:n,key:i,value:o}),kt=(e,n,i)=>W("handleMenuCheckboxChange",e,n,i),Lt=(e,n,i)=>W("handleMenuSelectChange",e,n,i),Tt=(e,n,i)=>W("handleMenuInputChange",e,n,i),Dt=(e,n)=>W("handleMenuButtonClick",e,n,null),At=(e,n)=>W("handleMenuRowFocus",e,n,null),Mt=({initialData:e,updatedData:n,isOpened:i,isLoading:o,onInputVisibleChange:l})=>{const[r,c]=a.exports.useState(),[f,h]=a.exports.useState(o),w=g=>{g.id===(r==null?void 0:r.id)&&(c(E=>{if(!(E!=null&&E.rows))return E;const C={...E};return C.rows=C.rows.map(d=>d.id===g.rowKey?g.updatedRow:d),C}),h(o||!1))};a.exports.useEffect(()=>{n&&w(n)},[n]),a.exports.useEffect(()=>{e&&e!==r&&c(e)},[e]);const m=(g,E,C)=>{const d=r==null?void 0:r.rows.find(L=>L.id===g);if(!(!r||!d)){if(E==="checkbox"&&"isChecked"in d&&d.isChecked!==C){kt(r.id,g,C),h(!0);return}else if(E==="input"&&"value"in d&&d.value!==C){Tt(r.id,g,C),h(!0);return}else if(E==="select"&&"selectedOption"in d&&JSON.stringify(d.selectedOption)!==JSON.stringify(C)){Lt(r.id,g,C),h(!0);return}}},x=g=>{r!=null&&r.id&&Dt(r==null?void 0:r.id,g)},N=g=>{r!=null&&r.id&&At(r==null?void 0:r.id,g)};return a.exports.useEffect(()=>{h(o||!1)},[o]),r?t(St,{id:r.id,header:r.header,headerTextColor:r.headerTextColor,headerImg:r.headerImg,title:r.title,accentColor:r.accentColor,maxRowsInView:r.maxRowsInView,loadingLabel:r.loadingLabel,rows:r.rows,onDataChange:m,onButtonClick:x,isOpened:i,loading:f,position:r.position,onInputVisibleChange:l,onRowFocus:N}):null},Ot=({keyBinds:e})=>{const[n,i]=a.exports.useState(),[o,l]=a.exports.useState(),[r,c]=a.exports.useState(),[f,h]=a.exports.useState(!1),[w,m]=a.exports.useState(!1),[x,N]=a.exports.useState(!1),g=y=>{i(y.id),y.rows=y.rows.sort((T,Z)=>T.order&&Z.order?T.order>Z.order?1:-1:0),l(y)},E=y=>{y.id===n&&c(y)},C=y=>{h(y.isOpened)},d=y=>{y===n&&l(void 0)},L=y=>{y.id===n&&m(y.isLoading)};S("reactMenuRegister",g),S("reactMenuDestroy",d),S("reactMenuUpdateData",E),S("reactMenuSetOpenState",C),S("reactMenuSetLoading",L);const O=a.exports.useCallback(y=>{var T;switch((T=y.key)==null?void 0:T.toUpperCase()){case e.closeMenuEscape:f&&!x&&j("handleMenuGoBack",{menuId:n});break}},[f,x]);return a.exports.useEffect(()=>(window.addEventListener("keyup",O),()=>{window.removeEventListener("keyup",O)}),[O]),o!=null&&o.rows?t(Mt,{initialData:o,updatedData:r,isOpened:f,isLoading:w,onInputVisibleChange:N}):null},Ne=a.exports.createContext({}),_t=({children:e})=>{const[n,i]=a.exports.useState(!0),[o,l]=a.exports.useState({}),[r,c]=a.exports.useState(),[f,h]=a.exports.useState(!1);return t(Ne.Provider,{value:{isLoading:n,translations:o,userConfig:r,isAdmin:f,setUserConfig:c,setTranslations:l,setIsLoading:i,setIsAdmin:h},children:e})},Ce=()=>{const e=a.exports.useContext(Ne);if(!e)throw new Error("useAppContext must be used within a ContextProvider");return e},It=()=>{const{translations:e}=Ce(),n=(o,l)=>{if(!o.length||!l)return l||null;const[r,...c]=o;return n(c,l[r])};return{t:(o,l)=>{const r=o.split(".");let c=n(r,e);if(c&&l)for(const[f,h]of Object.entries(l)){const w=new RegExp(`{${f}}`,"g");c=c.replace(w,h.toString())}return c||o}}},Pt=e=>{a.exports.useEffect(()=>{const n=i=>{["Escape"].includes(i.code)&&j(e)};return window.addEventListener("keydown",n),()=>window.removeEventListener("keydown",n)},[])};function Bt(...e){return Pe(Be(e))}const Ht=He("inline-flex items-center gap-2 border border-transparent justify-center rounded-md text-sm font-medium ring-offset-white transition-colors transition-opacity hover:bg-secondary focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-slate-950 focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 transition-colors duration-100",{variants:{variant:{default:"bg-primary border border-transparent ",destructive:"bg-red-500/70 text-slate-50 hover:bg-red-500/60",icon:""},size:{default:"h-10 px-3 py-2",sm:"h-9 rounded-md px-3",lg:"h-11 rounded-md px-8",icon:"h-8 w-8"}},defaultVariants:{variant:"default",size:"default"}}),Re=ce.forwardRef(({className:e,variant:n,size:i,asChild:o=!1,...l},r)=>t(o?Ue:"button",{className:Bt(Ht({variant:n,size:i,className:e})),ref:r,...l}));Re.displayName="Button";const $t=({entries:e})=>{const{t:n}=It(),i=()=>{j("leaderboard/close")};Pt("leaderboard/close");const o=[...e].sort((c,f)=>f.collected-c.collected),l=c=>{switch(c){case 1:return t(se,{className:"w-8 h-8 text-yellow-400 drop-shadow-[0_0_8px_rgba(250,204,21,0.6)]"});case 2:return t(se,{className:"w-7 h-7 text-gray-300 drop-shadow-[0_0_6px_rgba(209,213,219,0.5)]"});case 3:return t(se,{className:"w-6 h-6 text-orange-400 drop-shadow-[0_0_6px_rgba(251,146,60,0.5)]"});default:return t("div",{className:"w-8 h-8 rounded-full bg-white/10 flex items-center justify-center text-white font-bold text-sm",children:c})}},r=c=>{switch(c){case 1:return"bg-gradient-to-r from-yellow-500/30 to-yellow-600/30 border-yellow-400/50 shadow-lg shadow-yellow-500/20";case 2:return"bg-gradient-to-r from-gray-400/30 to-gray-500/30 border-gray-300/50 shadow-lg shadow-gray-400/20";case 3:return"bg-gradient-to-r from-orange-400/30 to-orange-500/30 border-orange-400/50 shadow-lg shadow-orange-400/20";default:return"bg-black/20 border-white/10 hover:bg-black/30"}};return p("div",{className:"flex flex-col bg-gradient-to-r from-secondary to-primary text-white rounded-2xl font-display w-[800px] max-w-[800px] select-none max-h-[90vh] shadow-lg",children:[p("div",{className:"flex items-center justify-between m-2 mx-6",children:[p("div",{className:"flex items-center gap-x-4 p-2",children:[t("div",{className:"p-3 bg-white/10 rounded-xl",children:t(re,{className:"w-8 h-8 text-yellow-400 drop-shadow-[0_0_10px_rgba(250,204,21,0.7)]"})}),p("div",{children:[t("p",{className:"text-2xl uppercase font-semibold tracking-wide",children:n("PRESENTHUNT_LEADERBOARD_TITLE")||"Present Hunt Leaderboard"}),t("p",{className:"text-sm text-white/70 font-main",children:n("PRESENTHUNT_LEADERBOARD_SUBTITLE",{count:o.length})||`Top ${o.length} Collectors`})]})]}),t(Re,{variant:"icon",size:"icon",onClick:i,children:t($e,{className:"w-8 h-8"})})]}),t("div",{className:"flex-1 overflow-y-scroll px-6 pb-6 scrollbar-thin scrollbar-thumb-white/20 scrollbar-track-white/5 h-full",children:o.length===0?t("div",{className:"flex items-center justify-center h-64",children:p("div",{className:"text-center",children:[t(re,{className:"w-16 h-16 mx-auto mb-4 text-white"}),t("p",{className:"text-white/70 text-lg",children:n("PRESENTHUNT_LEADERBOARD_NO_DATA")||"No present collectors yet!"}),t("p",{className:"text-white/50 text-sm mt-2",children:n("PRESENTHUNT_LEADERBOARD_NO_DATA_DESC")||"Be the first to collect presents and claim the top spot!"})]})}):t("div",{className:"space-y-3",children:o.map((c,f)=>{const h=f+1;return p("div",{className:`flex items-center gap-4 p-4 rounded-xl border-2 transition-all duration-200 ${r(h)}`,children:[t("div",{className:"flex-shrink-0",children:l(h)}),p("div",{className:"flex-1 min-w-0",children:[t("h3",{className:"font-semibold text-lg truncate",children:c.characterName}),h<=3&&p("p",{className:"text-xs text-white/60 font-main",children:[h===1&&(n("PRESENTHUNT_LEADERBOARD_CHAMPION")||"\u{1F384} Champion"),h===2&&(n("PRESENTHUNT_LEADERBOARD_RUNNER_UP")||"\u2B50 Runner Up"),h===3&&(n("PRESENTHUNT_LEADERBOARD_THIRD_PLACE")||"\u{1F381} Third Place")]})]}),p("div",{className:"flex items-center gap-2 bg-black/30 px-4 py-2 rounded-lg",children:[t("p",{className:"text-2xl font-bold leading-none",children:c.collected}),t("p",{className:"text-xs text-white/60 font-main",children:n("PRESENTHUNT_LEADERBOARD_PRESENTS")||"presents"})]})]},`${c.characterName}-${h}`)})})}),o.length>0&&t("div",{className:"px-6 pb-4",children:p("div",{className:"bg-black/20 rounded-lg p-3 flex items-center justify-between",children:[p("div",{className:"flex items-center gap-2",children:[t(re,{className:"w-5 h-5 text-white/60"}),p("span",{className:"text-sm text-white/70 font-main",children:[n("PRESENTHUNT_LEADERBOARD_TOTAL_COLLECTED")||"Total Collected",":"]}),t("span",{className:"text-lg font-bold",children:o.reduce((c,f)=>c+f.collected,0)})]}),t("div",{className:"text-xs text-white/50 font-main",children:n("PRESENTHUNT_LEADERBOARD_REFRESH")})]})})]})};var le=(e=>(e.PresentHuntLeaderboard="PresentHuntLeaderboard",e.CommandPanel="CommandPanel",e))(le||{});le.PresentHuntLeaderboard;const Vt=(e="dark")=>{const n=window.appConfig.themes[e];if(n){const i=document.documentElement.style;for(const[o,l]of Object.entries(n))i.setProperty(`--color-${o}`,l)}},Ut=()=>{const{userConfig:e,setUserConfig:n,setTranslations:i,isAdmin:o,setIsAdmin:l}=Ce(),[r,c]=a.exports.useState([]),[f,h]=a.exports.useState([]);return S("setTranslation",i),S("showScreen",w=>{h(m=>[...m,w])}),S("hideScreen",w=>{h(m=>m.filter(x=>x!==w))}),S("setLeaderboard",w=>{c(w.entries)}),S("setIsAdmin",l),a.exports.useEffect(()=>{(async()=>{var g;const x=await Ze(),N=x.activeTheme&&((g=x.themes)==null?void 0:g[x.activeTheme])?x.activeTheme:"dark";Vt(N),n(x)})()},[]),e?p("div",{className:"relative flex w-full px-8 h-full scrollbar-track-scrollbar-track scrollbar-thumb-scrollbar",style:{},children:[t(Qe,{}),t(Ot,{keyBinds:{closeMenuEscape:"BACKSPACE"}}),t("div",{className:"flex items-center justify-center w-full",children:f.includes(le.PresentHuntLeaderboard)&&t($t,{entries:r})})]}):null};const jt=a.exports.createContext(null),Wt=({children:e})=>{const[n,i]=a.exports.useState(!1);return S("setVisible",i),a.exports.useEffect(()=>{if(!n)return;const o=l=>{};return window.addEventListener("keydown",o),()=>window.removeEventListener("keydown",o)},[n]),t(jt.Provider,{value:{visible:n,setVisible:i},children:t("div",{style:{visibility:n?"visible":"hidden",height:"100%"},children:e})})},Zt={...console,assert:function(){}};window.console=Zt;Ie.createRoot(document.getElementById("root")).render(t(_t,{children:p(Wt,{children:[t(Ve,{snowflakeCount:200}),t(Ut,{})]})}));
