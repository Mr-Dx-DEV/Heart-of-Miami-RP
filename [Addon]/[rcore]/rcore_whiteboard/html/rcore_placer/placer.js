import * as THREE from 'three';
import { TransformControls } from 'transformControls';
//-------- ----------
// SCENE, CAMERA, RENDERER
//-------- ----------
let data = null
let mesh = null
let isSending = false
let sendTimeout = null
let sendChangesMade = false
let entityDimensions = {
    x: 0.0,
    y: 0.0,
    z: 0.0
};

let scene = null
let camera = null
let renderer = null
let material = null
let control = null

function destroyRcorePlacerControlsOverlay() {
    document.getElementById('rcore_placer_controls').innerHTML = ''
}
function createRcorePlacerControlsOverlay({ isInCameraMode, showSaveAndDiscard, isPositionRight }) {
    destroyRcorePlacerControlsOverlay()
    const menuContainer = document.createElement('div');
    menuContainer.style.backgroundColor = '#161717';
    menuContainer.style.padding = '18px 14px';
    menuContainer.style.borderTopLeftRadius = '12px';
    menuContainer.style.borderBottomLeftRadius = '12px';
    menuContainer.style.boxShadow = '0px 0px 10px rgba(0, 0, 0, 0.5)';
    menuContainer.style.width = '239px';
    menuContainer.style.position = 'absolute';
    if (isPositionRight) {
        menuContainer.style.right = '0';
    } else {
        menuContainer.style.left = '0';
    }
    menuContainer.style.top = '30%';
    menuContainer.style.fontFamily = 'Inter, sans-serif';
    menuContainer.style.color = '#fff';

    const menuHeader = document.createElement('div');
    menuHeader.style.backgroundColor = '#202020';
    menuHeader.style.padding = '5.5px 15px';
    menuHeader.style.fontSize = '18px';
    menuHeader.style.lineHeight = '22px';
    menuHeader.style.borderRadius = '12px';
    menuHeader.style.marginBottom = '17px';
    menuHeader.style.color = '#7A8699';
    menuHeader.style.fontWeight = '600';
    menuHeader.textContent = 'Editor';
    menuHeader.style.textAlign = 'center';
    menuContainer.appendChild(menuHeader);

    function createMenuItem(key, label) {
        const menuItem = document.createElement('div');
        menuItem.style.display = 'flex';
        menuItem.style.alignItems = 'center';
        menuItem.style.marginBottom = '20px';

        const menuItemKey = document.createElement('div');
        menuItemKey.style.backgroundColor = '#FFB30126';
        menuItemKey.style.color = '#FFB301';
        menuItemKey.style.fontWeight = '700';
        menuItemKey.style.fontSize = '20px';
        menuItemKey.style.borderRadius = '12px';
        menuItemKey.style.width = '45.1px';
        menuItemKey.style.height = '41px';
        menuItemKey.style.display = 'flex';
        menuItemKey.style.justifyContent = 'center';
        menuItemKey.style.alignItems = 'center';
        menuItemKey.style.marginRight = '11px';
        menuItemKey.textContent = key;

        const menuItemLabel = document.createElement('div');
        menuItemLabel.style.fontWeight = '600';
        menuItemLabel.style.color = '#7A8699';
        menuItemLabel.style.fontSize = '16px';
        menuItemLabel.style.lineHeight = '24px';
        menuItemLabel.textContent = label;

        menuItem.appendChild(menuItemKey);
        menuItem.appendChild(menuItemLabel);

        return menuItem;
    }

    if (isInCameraMode) {
        menuContainer.appendChild(createMenuItem('X', 'Show controls'));
        menuContainer.appendChild(createMenuItem('C', 'Center camera'));
    } else {
        menuContainer.appendChild(createMenuItem('X', 'Camera mode'));
        menuContainer.appendChild(createMenuItem('R', 'Rotation'));
        menuContainer.appendChild(createMenuItem('T', 'Placement'));
    }

    if (showSaveAndDiscard) {
        const finishItem = document.createElement('div');
        finishItem.style.display = 'flex';
        finishItem.style.alignItems = 'center';
        finishItem.style.marginBottom = '17px';

        const finishItemKey = document.createElement('div');
        finishItemKey.style.width = '113px';
        finishItemKey.style.height = '43px';
        finishItemKey.style.borderRadius = '12px';
        finishItemKey.style.background = '#31BA9626';
        finishItemKey.style.color = '#31BA96';
        finishItemKey.style.fontWeight = '700';
        finishItemKey.style.fontSize = '20px';
        finishItemKey.style.marginRight = '13px';
        finishItemKey.style.display = 'flex';
        finishItemKey.style.justifyContent = 'center';
        finishItemKey.style.alignItems = 'center';
        finishItemKey.textContent = 'Enter';

        const finishItemLabel = document.createElement('div');
        finishItemLabel.textContent = 'To finish';
        finishItemLabel.style.fontWeight = '600';
        finishItemLabel.style.color = '#7A8699';
        finishItemLabel.style.fontSize = '16px';
        finishItemLabel.style.lineHeight = '24px';

        finishItem.appendChild(finishItemKey);
        finishItem.appendChild(finishItemLabel);

        const discardItem = document.createElement('div');
        discardItem.style.display = 'flex';
        discardItem.style.alignItems = 'center';

        const discardItemKey = document.createElement('div');
        discardItemKey.style.width = '113px';
        discardItemKey.style.height = '43px';
        discardItemKey.style.borderRadius = '12px';
        discardItemKey.style.background = '#E3507A26';
        discardItemKey.style.color = '#E3507A';
        discardItemKey.style.fontWeight = '700';
        discardItemKey.style.fontSize = '16px';
        discardItemKey.style.marginRight = '13px';
        discardItemKey.style.display = 'flex';
        discardItemKey.style.justifyContent = 'center';
        discardItemKey.style.alignItems = 'center';
        discardItemKey.textContent = 'BACKSPACE';

        const discardItemLabel = document.createElement('div');
        discardItemLabel.textContent = 'To close';
        discardItemLabel.style.fontWeight = '600';
        discardItemLabel.style.color = '#7A8699';
        discardItemLabel.style.fontSize = '16px';
        discardItemLabel.style.lineHeight = '24px';

        discardItem.appendChild(discardItemKey);
        discardItem.appendChild(discardItemLabel);
        menuContainer.appendChild(finishItem);
        menuContainer.appendChild(discardItem);
    }

    document.getElementById('rcore_placer_controls').appendChild(menuContainer);

    const height = menuContainer.getBoundingClientRect().height;
    menuContainer.style.top = `calc((100% - ${height}px) / 2)`;
}

function createThreeJSScene() {
    scene = new THREE.Scene();
    scene.add(new THREE.GridHelper(5, 5));
    
    camera = new THREE.PerspectiveCamera(60, 2400 / 1350, 0.1, 1000);
    camera.position.set(0.0, 0.0, 0.0);

    renderer = new THREE.WebGLRenderer({ alpha: true });
    renderer.setSize(window.innerWidth, window.innerHeight); // Set initial size to fullscreen
    renderer.setClearColor(0x000000, 0);
    (document.getElementById('rcore_placer_scene') || document.body).appendChild(renderer.domElement);

    material = new THREE.MeshNormalMaterial();
    material.transparent = true;  // Enable transparency
    material.opacity = 0.3;

    camera.rotation.set(0.0, 0.0, 0.0);

    //Gizmo
    control = new TransformControls(camera, renderer.domElement);
    control.size = 0.0;
    control.space = "local";

    control.addEventListener('change', function (event) {
        sendChangesMade = true
    });
    control.position.set(0, 0, 0);
    scene.add(control);

    renderer.render(scene, camera);

    // DRAW LOOP
    function animate() {
        if (scene === null) {
            return
        }
        if (data !== null && mesh !== null && !isSending) {
            mesh.matrix.identity();
            mesh.position.set(0, 0, 0);
            mesh.rotation.set(0, 0, 0);

            mesh.scale.set(1, 1, 1);

            camera.matrix.identity();
            camera.position.set(0, 0, 0);
            camera.rotation.set(0, 0, 0);
            camera.scale.set(1, 1, 1);

            const threeJSCoords = FivemToThreeJSCoords(data.position);
            mesh.position.set(threeJSCoords.x, threeJSCoords.y, threeJSCoords.z);


            const threeJSRot = FivemToThreeJSRotation(data.rotation);
            mesh.quaternion.copy(threeJSRot)
            mesh.rotateX(THREE.MathUtils.degToRad(data.rotation.x))

            const threeJSCamCoords = FivemToThreeJSCoords(data.camPos);
            camera.position.set(threeJSCamCoords.x, threeJSCamCoords.y, threeJSCamCoords.z);


            const threeJSCamRot = FivemToThreeJSRotation(data.camRot);
            camera.quaternion.copy(threeJSCamRot);
            camera.rotateX(THREE.MathUtils.degToRad(data.camRot.x))

            const controlOffset = new THREE.Vector3(0, entityDimensions.y / 2, entityDimensions.z / 2);
            const rotatedControlOffset = controlOffset.clone().applyQuaternion(mesh.quaternion);
            control.position.copy(rotatedControlOffset);
            control.updateMatrix();
            mesh.updateMatrix();
        }
        renderer.render(scene, camera);
        requestAnimationFrame(animate);
    }
    animate();
}

function clearThreeJSScene() {
    document.getElementById('rcore_placer').style.display = 'none';
    destroyRcorePlacerControlsOverlay()
    document.getElementById('rcore_placer_scene').innerHTML = '';
    scene = null
    camera = null
    renderer = null
    material = null
    control = null
}
//-------- ----------
// RENDER
//-------- ----------

function SendDataToFivem() {
    if (!sendChangesMade) {
        sendTimeout = setTimeout(SendDataToFivem, 33)
        return
    }
    const quaternion = mesh.quaternion;
    const euler = new THREE.Euler().setFromQuaternion(quaternion, 'YXZ');

    // Convert Euler angles to degrees
    const rotation = {
        x: THREE.MathUtils.radToDeg(euler.x + 0.001),
        y: THREE.MathUtils.radToDeg(euler.y + 0.001),
        z: THREE.MathUtils.radToDeg(euler.z + 0.001)
    };
    // Fivem Bug alebo moj bug? Rotacia X sa glitchuje ak ostatne dimenze su presne na 0

    // Adjust for coordinate system differences
    const adjustedRotation = {
        x: rotation.x,
        y: -rotation.z,  // Swap and negate
        z: rotation.y    // Swap
    };


    fetch(`https://${GetParentResourceName()}/controlupdate`, {
        method: "POST",
        headers: { "Content-Type": "application/json; charset=UTF-8" },
        body: JSON.stringify({
            position: {
                x: mesh.position.x,
                y: -mesh.position.z,
                z: mesh.position.y
            },
            rotation: adjustedRotation,
        }),
    });
    sendChangesMade = false
    sendTimeout = setTimeout(SendDataToFivem, 33)
}

function FivemToThreeJSCoords(position) {
    return new THREE.Vector3(position.x, position.z, -position.y);
}

function FivemToThreeJSRotation(fivemRotation) {
    const quaternion = new THREE.Quaternion().setFromEuler(
        new THREE.Euler(
            THREE.MathUtils.degToRad(0),
            THREE.MathUtils.degToRad(fivemRotation.z),
            THREE.MathUtils.degToRad(-fivemRotation.y),
            'XYZ' // or 'YZX', 'ZYX', etc.
        )
    );
    return quaternion;
}
// FIVEM EVENTS
window.addEventListener('message', (event) => {
    if (event.data.action == 'fivemdata') {
        data = event.data
    }
    if (event.data.action == 'fivemmode') {
        var mode = event.data.mode
        isSending = mode == 1
        if (isSending) {
            SendDataToFivem();
            control.size = 0.5
        } else {
            if (sendTimeout !== null) {
                clearTimeout(sendTimeout)
            }
        }
        createRcorePlacerControlsOverlay({
            isInCameraMode: !isSending,
            showSaveAndDiscard: !isSending,
            isPositionRight: true,
        })
    }
    if (event.data.action == "fivemdeselect") {
        if (mesh !== null) {
            control.detach(mesh);
            scene.remove(mesh);
        }
        mesh = null;
        data = null;

        clearThreeJSScene();
    }
    if (event.data.action == "fivemselect") {
        document.getElementById('rcore_placer').style.display = 'block';
        createRcorePlacerControlsOverlay({
            isInCameraMode: true,
            showSaveAndDiscard: true,
            isPositionRight: true,
        })
        createThreeJSScene();

        const dimensions = event.data.dimensions;
        const dimOffset = event.data.dimoffset;

        entityDimensions = {
            x: dimensions.x,
            y: dimensions.z,
            z: dimensions.y
        }

        const dimensionOffset = {
            x: dimOffset.x,
            y: dimOffset.z,
            z: dimOffset.y
        }

        //-------- ----------
        // MESH USING THREE.BoxGeometry and THREE.MeshNormalMaterial
        //-------- ----------
        const newMesh = new THREE.Mesh(
            new THREE.BoxGeometry(entityDimensions.x, entityDimensions.y, entityDimensions.z),
            material);
        scene.add(newMesh);

        newMesh.geometry.translate(dimensionOffset.x, dimensionOffset.y, dimensionOffset.z);
        newMesh.position.set(0.0, 0.0, -15.0);
        newMesh.rotation.set(0.0, 0.0, 0.0);

        control.attach(newMesh);

        if (mesh !== null) {
            control.detach(mesh);
            scene.remove(mesh);
        }
        mesh = newMesh;
    }
});

// KEY EVENTS
window.addEventListener('keydown', (event) => {
    if (event.key === 'x' || event.key === 'X') {
        if (isSending) {
            data = null
            isSending = false
            if (sendTimeout !== null) {
                clearTimeout(sendTimeout)
            }
            //call fivem to clear nui focus & go to cam mode
            fetch(`https://${GetParentResourceName()}/stopcontrol`);
            control.size = 0.0
        }
    } else if (event.key === 'r' || event.key === 'R') {
        if (control) {
            control.setMode("rotate");
        }
    } else if (event.key === 't' || event.key === 't') {
        if (control) {
            control.setMode("translate");
        }
    }
});