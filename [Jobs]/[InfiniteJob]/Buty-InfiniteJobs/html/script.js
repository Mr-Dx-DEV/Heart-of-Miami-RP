var app = new Vue({
   el: "#app",
   data: {
      selectedJobIndex: 1,
      display: false,
      data: [],
      jobs: [],
   },
   computed: {
      onLeftClick: function () {
         return () => {
            if (app.selectedJobIndex == 0) {
               return;
            }
            var audio = document.getElementById('swipeJobCenter');
            audio.pause();
            audio.currentTime = 0;
            audio.play()
            if (app.selectedJobIndex == 1) {
               document.querySelector(".slider").style.left = 502 + "px";
               app.selectedJobIndex = 0;
               return;
            }
            document.querySelector(".slider").style.left = "-" + (app.selectedJobIndex - 2) * 502 + "px";
            app.selectedJobIndex = app.selectedJobIndex - 1;
         };
      },
      onRightClick: function () {
         return () => {
            if (app.selectedJobIndex + 1 == app.jobs.length) return;
            var audio = document.getElementById('swipeJobCenter');
            audio.pause();
            audio.currentTime = 0;
            audio.play()
            document.querySelector(".slider").style.left = "-" + app.selectedJobIndex * 502 + "px";
            app.selectedJobIndex = app.selectedJobIndex + 1;
         };
      },
      selectJOB: function () {
         return (index) => {
            var audio = document.getElementById('buttonJobCenter');
            audio.pause();
            audio.currentTime = 0;
            audio.play()
            $.post(`https://${GetParentResourceName()}/selectjob`, JSON.stringify({ job: index }));
            $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
            app.display = false;
         };
      },
      NEXTSTEP: function () {
         return (index) => {
            $.post(`https://${GetParentResourceName()}/next_step`, JSON.stringify({ step: 1 }));
         };
      },
   },
});

let LangData = {};

$(document).ready(function () {
    $.post(`https://${GetParentResourceName()}/GetLangData`, JSON.stringify({}), function (lang) {
        LangData = lang.table[lang.current];
        applyTranslations();
    });
});

function applyTranslations() {
    $("[data-lang]").each(function () {
        let key = $(this).data("lang");
        if (LangData[key]) {
            $(this).text(LangData[key]);
        }
    });
}

window.addEventListener("message", (event) => {
   if (event.data.color) {
      document.documentElement.style.setProperty("--color", event.data.color);
  }
   switch (event.data.type) {

      case "newprogress":
         var container = document.querySelector('.container-9');
         container.style.display = 'block';
         container.style.animation = 'slide-in-bottom 0.5s cubic-bezier(0.250, 0.460, 0.450, 0.940) both';
         var audio = document.getElementById('ShowProgress');
         audio.pause();
         audio.currentTime = 0;
         audio.play()
         let exp = event.data.xp;
         let expreq = event.data.xpreq;
         let lvl = event.data.lvl;
     
         const progressCircle = document.querySelector('.progress');
         const progressText = document.querySelector('.progress-text');
         const levelText = document.querySelector('.level-text');
 
         const radius = progressCircle.getAttribute('r');
         const circumference = 2 * Math.PI * radius;
 
         progressCircle.style.strokeDasharray = circumference;
 
         let currentProgress = 0;
 
         const calculateProgress = () => Math.min(exp / expreq * 100, 100);
 
         const animateProgress = (start, end, duration) => {
             const startTime = performance.now();
 
             const animate = (currentTime) => {
                 const elapsed = currentTime - startTime;
                 const progress = Math.min(elapsed / duration, 1);
                 const interpolatedValue = start + (end - start) * progress;
 
                 currentProgress = interpolatedValue;
                 updateProgress(currentProgress);
 
                 if (progress < 1) {
                     requestAnimationFrame(animate);
                 }
             };
 
             requestAnimationFrame(animate);
         };
 
         const updateProgress = (progress) => {
             const offset = circumference * (1 - progress / 100);
             progressCircle.style.strokeDashoffset = offset;
 
             levelText.textContent = `LVL ${lvl}`;
             progressText.textContent = `${Math.round(progress * expreq / 100)}/${expreq} XP`;
         };
 
         animateProgress(0, calculateProgress(), 1000);
 
         const interval = setInterval(() => {
             if (exp !== exp) {
                 exp += 10;
                 animateProgress(currentProgress, Math.min(exp / expreq * 100, 100), 500);
             } else {
                 clearInterval(interval);
             }
         }, 500);
     
         setTimeout(function () {
             container.style.animation = 'slide-out-bottom 0.5s cubic-bezier(0.250, 0.460, 0.450, 0.940) both';
             setTimeout(function () {
                 container.style.display = 'none';
             }, 500);
         }, 4000);
         break;
      case "ui":
        hideTutorial();
        app.display = event.data.status;
        app.jobs = [];
        app.maxLevel = event.data.maxLevel || 10;
        translate = event.data.translate;
        if  (event.data.status == true) {
            $("#leftelectjob").html(`
            <ion-icon name="briefcase-outline"></ion-icon>
            <h1 class="title">   ${event.data.translate[6]} <span> ${event.data.translate[7]}</span></h1>
            `);
            $("#rightselectorjob").html(`
            <h1>  ${event.data.translate[4]} <span>  ${event.data.translate[5]}</span></h1>
            `);
            for (const job in event.data.jobs) {
              const hasJobConfig = event.data.jobs[job].JobConfig !== undefined;
              app.jobs.push({
                 data: event.data.jobs[job].JobInfo,
                 typejob: hasJobConfig,
                 info: event.data.jobs[job][3],
              });
            }
        }     
      break;
      case "tutorial":
         app.display = event.data.status;
         if  (event.data.status == true) {
            const namejob = document.getElementById("namejob");
            document.getElementById("namejob").textContent = event.data.jobname;
            const tutorialText2 = event.data.tutorialText;
            $("#next-button").html(`
            <span>${event.data.translate[0]}</span> ${event.data.translate[1]} >
            `);
            updateTutorialText(tutorialText2);
            showTutorial();
         }
      break;

      case "tutorialupdate":
         const tutorialText = event.data.tutorialText;
         updateTutorialText(tutorialText);
         const isLastStep = event.data.isLastStep;
         updateButtonText(isLastStep, event.data.translate);
      break;

      case "steps_total":
         var container = document.querySelector('.container-3');
         if (event.data.status == true) {
             document.getElementById("total_steps").textContent = event.data.text;
             document.getElementById("total_steps_2").textContent = event.data.text2;
             container.style.display = 'block';
             container.style.animation = 'slide-in-top 0.5s cubic-bezier(0.250, 0.460, 0.450, 0.940) both';
         } else {
             container.style.animation = 'slide-out-top 0.5s cubic-bezier(0.550, 0.085, 0.680, 0.530) both';
             setTimeout(function() {
                 container.style.display = 'none';
             }, 500);
         }
        break;

        case "group_menu":
           var container = document.querySelector('.container-4');
           if (event.data.status == true) {
              document.getElementById("jobname").textContent = event.data.jobname;
              $(".start_text").html(`
              ${event.data.translate[0]} <span id="start_text"> ${event.data.translate[1]}</span>
              `);
              container.style.display = 'block';
              container.style.animation = 'popup 500ms';
           } else {
              container.style.animation = 'popdown 500ms';
              setTimeout(function() {
                 container.style.display = 'none';
              }, 500);
           }
        break;

        case "finish_menu":
           var container = document.querySelector('.container-8');
           if (event.data.status == true) {
              document.getElementById("jobname2").textContent = event.data.jobname;
              container.style.display = 'block';
              container.style.animation = 'popup 500ms';
           } else {
              container.style.animation = 'popdown 500ms';
              setTimeout(function() {
                 container.style.display = 'none';
              }, 500);
           }
        break;

        case "sell":
           var container = document.querySelector('.container-7');
           var items = event.data.items;
           var totalItemsContainer = document.getElementById("totalItems");
           totalItemsContainer.innerHTML = '';
       
           if (event.data.status) {
               document.querySelector('.container-7').style.display = 'block';
               container.style.animation = 'popup 500ms';
               $("#textbuyer").html(`
               ${event.data.translate[0]} <span id="supplier"> ${event.data.translate[1]}</span>
               `);
               $("#selected_item").html(`
               ${event.data.translate[5]}  <span id="item"> ${event.data.translate[2]}</span>
               `);
               document.getElementById("price_wholesale").textContent = '$u';
               document.getElementById("price_retail").textContent = '$u';
               document.getElementById("item").textContent = event.data.translate[2];
               document.getElementById("retail").textContent = event.data.translate[3] + ` (0/${event.data.retailtcount})`;
               document.getElementById("wholesale").textContent = event.data.translate[4] +` (0/${event.data.wholesalecount})`;
       
               const retailButton = document.querySelector('.retail');
               const wholesaleButton = document.querySelector('.wholesale');
               const priceRetail = document.querySelector(".price_retail");
               const priceWholesale = document.querySelector(".price_wholesale");
       
               retailButton.classList.add('disabled');
               wholesaleButton.classList.add('disabled');
               priceRetail.classList.add('disabled');
               priceWholesale.classList.add('disabled');
       
               items.forEach(item => {
                   const itemDiv = document.createElement('div');
                   itemDiv.classList.add('itemsell');
                   itemDiv.tabIndex = 0;
                   itemDiv.innerHTML = `
                   <img src="${item.img}" alt="${item.label}" onerror="this.onerror=null; this.src='./img/item.png';">
                   <span>${item.label}</span>
               `;
               
       
                   itemDiv.addEventListener('click', function() {
                       const text_name = document.getElementById("item");
                       const selected_item = document.getElementById("selected_item");
                       text_name.style.animation = 'none';
                       selected_item.style.animation = 'none';
                       void selected_item.offsetWidth;
                       void text_name.offsetWidth;
                       text_name.style.animation = 'popup 500ms';
                       text_name.textContent = item.label;
                       selected_item.style.animation = 'popup 500ms';
                       selectedItem = item.name;
                       priceItemRetail = item.price.retail;
                       priceItemWholesale = item.price.wholesale;
                       
                       document.getElementById("price_retail").textContent = `$${item.price.retail}u`;
                       document.getElementById("price_wholesale").textContent = `$${item.price.wholesale}u`;
                       document.getElementById("retail").textContent =  event.data.translate[3] + ` (${item.count}/${event.data.retailtcount})`;
                       document.getElementById("wholesale").textContent = event.data.translate[4] + ` (${item.count}/${event.data.wholesalecount})`;
       
                       retailButton.classList.toggle('disabled', item.count < event.data.retailtcount);
                       wholesaleButton.classList.toggle('disabled', item.count < event.data.wholesalecount);
                       priceRetail.classList.toggle('disabled', item.count < event.data.retailtcount);
                       priceWholesale.classList.toggle('disabled', item.count < event.data.wholesalecount);
                   });       
                   totalItemsContainer.appendChild(itemDiv);
               });
       
               for (let i = items.length; i < 100; i++) {
                   const emptyItemDiv = document.createElement('div');
                   emptyItemDiv.classList.add('itemsell', 'empty-item');
                   emptyItemDiv.tabIndex = -1;
                   emptyItemDiv.innerHTML = ``;
                   totalItemsContainer.appendChild(emptyItemDiv);
               }
       
           } else {
               container.style.animation = 'popdown 500ms';
               setTimeout(function() {
                   container.style.display = 'none';
               }, 500);
           }
           break;
       
      case "invite":
         var container = document.querySelector('.container-6');
         slot_use = event.data.slot
         if (event.data.status == true) {
             lobby_Owner = event.data.ownerLobby
             container.style.display = 'flex';
             container.style.animation = 'slide-in-top 0.5s cubic-bezier(0.250, 0.460, 0.450, 0.940) both';
         } else {
             container.style.animation = 'slide-out-top 0.5s cubic-bezier(0.550, 0.085, 0.680, 0.530) both';
             setTimeout(function() {
                 container.style.display = 'none';
             }, 500);
         }
      break;

      case "updateui":
         var container = document.querySelector('.container-6');
         var slot = event.data.slot;
         if (event.data.status == true) {
            document.querySelector(`#img_user${slot}`).style.display = 'none';
            document.querySelector(`.player${slot} span`).textContent = "ID " + event.data.addPlayer;
            document.querySelector(`.player${slot}`).classList.add('no-hover');
            document.querySelector(`.invite${slot}`).classList.remove('show');
         } else {
         }
      break;

      case "exit_multimenu":
         var container = document.querySelector('.container-5');
         container.style.animation = 'popdown 500ms';
         setTimeout(function() {
            container.style.display = 'none';
         }, 500);
     break;


      default:
         console.log("unknow!");
         break;
   }
});

function accept_invite() {
   $.post(`https://${GetParentResourceName()}/accept_invite`, JSON.stringify({}));
}

function updateTutorialText(text) {
   document.getElementById("tutorial-text").textContent = text;
}

function updateButtonText(isLastStep, trans) {
   const buttonElement = document.getElementById("next-button");

   if (buttonElement) {
       buttonElement.onclick = function() {
           if (isLastStep) {
               hideTutorial();
               $.post(`https://${GetParentResourceName()}/skip_tutorial`, JSON.stringify({}));
               buttonElement.textContent = trans[1] + trans[2];
               buttonElement.onclick = function() {
                   $.post(`https://${GetParentResourceName()}/next_step`, JSON.stringify({}));
               };
           } else {
               $.post(`https://${GetParentResourceName()}/next_step`, JSON.stringify({}));
           }
       };

       buttonElement.textContent = isLastStep ? trans[2] : trans[0] + trans[1];
   }
}


function close_start(container, action) {
  $.post(`https://${GetParentResourceName()}/check_pending_invites`, JSON.stringify({action}), function(hasPendingInvite) {
      if (hasPendingInvite && action === "start")  {
          return;
      }
      
      document.querySelector(container).style.animation = 'popdown 500ms';

      setTimeout(function() {
          const invites = document.querySelectorAll('.invite1, .invite2, .invite3');
          invites.forEach(invite => {
              invite.classList.remove('show');
              invite.classList.add('hide');
          });
          document.querySelector(`#img_user1`).style.display = 'block';
          document.querySelector(`#img_user2`).style.display = 'block';
          document.querySelector(`#img_user3`).style.display = 'block';
          document.querySelector('.container-5').style.height = '15.5vw';
          document.querySelector('.container-5').style.display = 'none';
          document.querySelector('.container-4').style.display = 'none';
          document.querySelector('.startjob').style.display = 'none';
          document.querySelector(`.player1`).classList.remove('no-hover');
          document.querySelector(`.player2`).classList.remove('no-hover');
          document.querySelector(`.player3`).classList.remove('no-hover');
          document.querySelector(`.player1 span`).textContent = '';
          document.querySelector(`.player2 span`).textContent = '';
          document.querySelector(`.player3 span`).textContent = '';
      }, 400);

      $.post(`https://${GetParentResourceName()}/close_ui_start`, JSON.stringify({}));
  });
}

function startjob(type,action) {
   if (type === "alone") {
     $.post(`https://${GetParentResourceName()}/check_pending_invites`, JSON.stringify({action}), function(hasPendingInvite) {
        if (hasPendingInvite) {
            return;
        }
        close_start(".container-4", "close");
        $.post(`https://${GetParentResourceName()}/startjob`, JSON.stringify({}));
     });
   }else {
      var screen = document.querySelector('.container-4');
      screen.style.animation = 'popdown 500ms';
      setTimeout(function() {
         screen.style.display = 'none';
         document.querySelector('.container-5').style.display = 'block';
         
         document.querySelector('.container-5').style.animation = 'popup 500ms';
      }, 400);
   }
}

function invite(slot) {
   const container = document.querySelector('.container-5');
   const invites = {
       1: document.querySelector('.invite1'),
       2: document.querySelector('.invite2'),
       3: document.querySelector('.invite3')
   };

   container.style.height = '24.5vw';
   setTimeout(() => {
       container.style.display = 'block';
       document.querySelector('.startjob').style.display = 'block';
       document.querySelector('.startjob').style.animation = 'popup 500ms';
   }, 500);

   for (const [key, invite] of Object.entries(invites)) {
       if (parseInt(key) === slot) {
           invite.classList.remove('hide');
           invite.classList.add('show');
       } else {
           invite.classList.remove('show');
           invite.classList.add('hide');
           
           invite.addEventListener('animationend', () => {
               if (invite.classList.contains('hide')) {
                   invite.style.display = 'none';
               }
           }, { once: true });
       }
   }
}

function send(slot) {
   const inputElement = document.querySelector(`.player${slot}-id`);
   const inputValue = inputElement.value;

   if (inputValue) {
       $.post(`https://${GetParentResourceName()}/send_invite`, JSON.stringify({ inputValue, slot }));
       inputElement.value = '';
       document.querySelector('.startjob').style.display = 'block';
   }
}

function team_invite(data) {
   $.post(`https://${GetParentResourceName()}/invite`, JSON.stringify({data, slot_use}));
}

function closesell(){
  $.post(`https://${GetParentResourceName()}/closesell`, JSON.stringify({}));
}

function closefinish(){
  $.post(`https://${GetParentResourceName()}/closefinish`, JSON.stringify({}));
}

function sell(selltype) {
  $.post(`https://${GetParentResourceName()}/closesell`, JSON.stringify({}));
  $.post(`https://${GetParentResourceName()}/sell`, JSON.stringify({ selltype, selectedItem, priceItemRetail, priceItemWholesale }));
}

function startmultiplayerjob(action) {
   $.post(`https://${GetParentResourceName()}/check_pending_invites`, JSON.stringify({action}), function(hasPendingInvite) {
      if (hasPendingInvite && action === "start")  {
          return;
      }
     close_start(".container-5", "start");
     $.post(`https://${GetParentResourceName()}/startjob`, JSON.stringify({}));
  });
}

function finish(type) {
  closefinish()
  $.post(`https://${GetParentResourceName()}/finish`, JSON.stringify(type));
}

document.onkeyup = function (data) {
  const isTutorialActive = document.querySelector(".container-2").classList.contains("active");
  const groupMenuOpen = document.querySelector('.container-4').style.display === 'block';
  const groupMenuOpen2 = document.querySelector('.container-5').style.display === 'block';
  const groupMenuOpen3 = document.querySelector('.container-6').style.display === 'flex';
  const buyerMenu = document.querySelector('.container-7').style.display === 'block';

  if (groupMenuOpen || groupMenuOpen2 || groupMenuOpen3 || buyerMenu) {
      return;
  }
  
  if (data.which === 8) {
      if (isTutorialActive) {
          $.post(`https://${GetParentResourceName()}/skip_tutorial`, JSON.stringify({}));
          hideTutorial();
      } else {
          hideTutorial();
          $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
          app.display = false;
      }
      return;
  }
};



const showTutorial = () => {
   document.querySelector(".container").classList.add("hidden");
   document.querySelector(".container-3").classList.add("hidden");
   document.querySelector(".container-2").classList.add("active");
};

const hideTutorial = () => {
   document.querySelector(".container").classList.remove("hidden");
   document.querySelector(".container-3").classList.remove("hidden");
   document.querySelector(".container-2").classList.remove("active");
};


