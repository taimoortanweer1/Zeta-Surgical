.pragma library

var lightPanelColor = "#44ffffff"
var midDarkPanelColor = "#44000000"
var softDarkPanelColor = "#15000000"
var midDarkPanelColorNoTransparency = "#484848"
var darkPanelColor = "#88000000"
var veryDarkPanelColor = "#aa000000"
var overlayPanelColor = "#bf080808"
var opaqueDarkPanelColor = "#353535"
var darkPanelColorNoTransparency = "#282828"
var highlightPanelColor = "#4489c435"
var highlightDarkPanelColor = "#44888888"
var delicatePanelColor = "#a0000000"
var borderColor = "#282828"
var borderShadowColor = "#88282828"
var negativeColor = "red"
var positiveColor = "white"
var highlightColor = "#31CB6E"
var transparentHighlightColor = "#5031CB6E"
var importBorderColor = "#6bb0e5"
var importColor = "#446bb0e5"
var dialogTitleBarColor = "#31CB6E"
var dialogTitleBarLabelColor = "#282828"
var dialogButtonColor = "#357850"
var dialogButtonTextColor = "#FFFFFF"
var applicationNameColor = "#D8EFB8"
var versionNumberColor = "#8DD920"
var foregroundColor = "#FFFFFF"
var rulerTickColor = "#737373"
var rulerTextColor = "#FFFFFF"
var rulerBackgroundColor = "#373737"
var rulerCornerColor = "#484848"
var sliderBackgroundColor = "#A9A9A9"
var sliderProgressColor = "#5DFF9D"
var sliderHandleColor = "#282828"
var sliderHandleBorderColor = "#A9A9A9"
var sliderTextColor = "#FFFFFF"
var scrollBarBackgroundColor = "#00000000"
var scrollBarHandleColor = "#807E7E7E"
var slideInColor = "#484848"
var headerPanelColor = "#5f5f5f"
var modalOverlayColor = "#6f000000"
var contextHighlightColor = "#676767"

var paneColor = "#484848"
var paneBorderColor = "#414141"
var listItemOddBackground = "#454545"
var listItemEvenBackground = "#4B4B4B"
var listItemHoveredBackground = "#5F5F5F"

var buttonBackground = "#373737"
var buttonHoveredBackground = "#474747"

var layoutConstraintsColor = "#357850"
var activeLayoutConstraintsColor = "#31cb6e"

var accentColor = "#5DFF9D"
var altAccentColor = "#77b3af"
var altHighlightColor = "#cece59"
var accentShadowColor = "#885DFF9D"
var foregroundColor = "#FFFFFF"

var graphLineBaseColor = "#45a8d5"
var graphLineAltColor = "#7c4c9a"

var propertySectionHeaderColor = "#373737"
var emptyAreasFontColor = "gray"

function argumentIconDrawFunction(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    ctx.moveTo(canvas.width * 0.25, canvas.height * 0.25)
    ctx.lineTo(canvas.width * 0.75, canvas.height * 0.25)
    ctx.lineTo(canvas.width * 0.75, canvas.height * 0.75)
    ctx.lineTo(canvas.width * 0.25, canvas.height * 0.75)
    ctx.lineTo(canvas.width * 0.25, canvas.height * 0.25)
    ctx.fill()
    ctx.stroke()
    ctx.moveTo(canvas.width * 0.5, canvas.height * 0.1)
    ctx.lineTo(canvas.width * 0.9, canvas.height * 0.5)
    ctx.lineTo(canvas.width * 0.5, canvas.height * 0.9)
    ctx.lineTo(canvas.width * 0.1, canvas.height * 0.5)
    ctx.lineTo(canvas.width * 0.5, canvas.height * 0.1)
    ctx.fill()
    ctx.stroke()
}

function signalIconDrawFunction(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    ctx.fillRect(0, 0, canvas.width * 0.2, canvas.height)
    ctx.fillStyle = "darkGray"
    ctx.moveTo(canvas.width * 0.2, canvas.height * 0.3)
    ctx.lineTo(canvas.width * 0.2, canvas.height * 0.7)
    ctx.lineTo(canvas.width * 0.6, canvas.height * 0.7)
    ctx.lineTo(canvas.width * 0.6, canvas.height * 0.8)
    ctx.lineTo(canvas.width, canvas.height * 0.5)
    ctx.lineTo(canvas.width * 0.6, canvas.height * 0.2)
    ctx.lineTo(canvas.width * 0.6, canvas.height * 0.3)
    ctx.lineTo(canvas.width * 0.2, canvas.height * 0.3)
    ctx.fill()
    ctx.stroke()
}

function methodIconDrawFunction(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    ctx.fillRect(canvas.width * 0.8, 0, canvas.width * 0.2, canvas.height)
    ctx.fillStyle = "darkGray"
    ctx.moveTo(0, canvas.height * 0.3)
    ctx.lineTo(0, canvas.height * 0.7)
    ctx.lineTo(canvas.width * 0.4, canvas.height * 0.7)
    ctx.lineTo(canvas.width * 0.4, canvas.height * 0.8)
    ctx.lineTo(canvas.width * 0.8, canvas.height * 0.5)
    ctx.lineTo(canvas.width * 0.4, canvas.height * 0.2)
    ctx.lineTo(canvas.width * 0.4, canvas.height * 0.3)
    ctx.lineTo(0, canvas.height * 0.3)
    ctx.fill()
    ctx.stroke()
}

function surfaceIconDrawFunction(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    for (var i = 0; i < 3; ++i) {
        for (var j = 0; j < 3; ++j) {
            ctx.fillRect(8 * i, 8 * j, 6, 6)
        }
    }
}

function stateIconDrawFunction(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    for (var i = 0; i < 3; ++i) {
        for (var j = 0; j < 3; ++j) {
            ctx.fillRect(8 * i, 8 * j, 6, 6)
        }
    }
}

function conditionalStateIconDrawFunction(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    ctx.fillRect(canvas.width * 0.1, 0, canvas.width * 0.8, canvas.height * 0.2)
    ctx.fillRect(canvas.width * 0.7, canvas.height * 0.2, canvas.width * 0.2, canvas.height * 0.3)
    ctx.fillRect(canvas.width * 0.4, canvas.height * 0.5, canvas.width * 0.5, canvas.height * 0.2)
    ctx.fillRect(canvas.width * 0.4, canvas.height * 0.8, canvas.width * 0.2, canvas.height * 0.2)
}

function screenMasterStateIconDrawFunction(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    ctx.fillRect(0, 0, canvas.width, canvas.height * 0.1)
    ctx.fillRect(canvas.width * 0.9, 0, canvas.width * 0.1, canvas.height * 0.7)
    ctx.fillRect(0, canvas.height * 0.7, canvas.width, canvas.height * 0.1)
    ctx.fillRect(0, 0, canvas.width * 0.1, canvas.height * 0.7)
    ctx.fillRect(canvas.width * 0.25, canvas.height * 0.9, canvas.width * 0.5, canvas.height)
    ctx.fillRect(canvas.width * 0.25, canvas.height * 0.25, canvas.width * 0.5, canvas.height * 0.3)
}

function screenPanelStateIconDrawFunction(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    ctx.fillRect(0, 0, canvas.width, canvas.height * 0.1)
    ctx.fillRect(canvas.width * 0.9, 0, canvas.width * 0.1, canvas.height * 0.7)
    ctx.fillRect(0, canvas.height * 0.7, canvas.width, canvas.height * 0.1)
    ctx.fillRect(0, 0, canvas.width * 0.1, canvas.height * 0.7)
    ctx.fillRect(canvas.width * 0.25, canvas.height * 0.9, canvas.width * 0.5, canvas.height)
    ctx.fillStyle = highlightColor
    ctx.fillRect(canvas.width * 0.25, canvas.height * 0.25, canvas.width * 0.5, canvas.height * 0.3)
}

function emptyStateIconDrawFunction(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    ctx.fillRect(0, 0, canvas.width, canvas.height * 0.2)
    ctx.fillRect(canvas.width * 0.8, 0, canvas.width * 0.2, canvas.height)
    ctx.fillRect(0, canvas.height * 0.8, canvas.width, canvas.height * 0.2)
    ctx.fillRect(0, 0, canvas.width * 0.2, canvas.height)
}

function parallelStateIconDrawFunction(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    ctx.fillRect(canvas.width * 0.2, 0, canvas.width * 0.2, canvas.height)
    ctx.fillRect(canvas.width * 0.6, 0, canvas.width * 0.2, canvas.height)
}

function backendObjectIconDrawFunction(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "darkgray"
    ctx.fillRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    ctx.strokeStyle = "black"
    ctx.moveTo(canvas.width * 0.5, 0)
    ctx.lineTo(canvas.width, canvas.height * 0.5)
    ctx.lineTo(canvas.width * 0.5, canvas.height)
    ctx.lineTo(0, canvas.height * 0.5)
    ctx.lineTo(canvas.width * 0.5, 0)
    ctx.fill()
    ctx.stroke()
}

function componentIconDrawFunction(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "darkGray"
    ctx.fillRect(5, 5, 6, 6)
    ctx.fillRect(13, 13, 6, 6)
    ctx.fillStyle = "gray"
    ctx.fillRect(5, 13, 6, 6)
    ctx.fillRect(13, 5, 6, 6)
}

function testObjectIconDrawFunction(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "darkgray"
    ctx.fillRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    ctx.strokeStyle = "black"
    ctx.moveTo(canvas.width * 0.5, 0)
    ctx.lineTo(canvas.width, canvas.height * 0.5)
    ctx.lineTo(canvas.width * 0.5, canvas.height)
    ctx.lineTo(0, canvas.height * 0.5)
    ctx.lineTo(canvas.width * 0.5, 0)
    ctx.fill()
    ctx.stroke()
}

function fontIconDrawFunction(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    ctx.fillRect(0, 0, canvas.width * 0.2, canvas.height)
    ctx.fillRect(canvas.width * 0.2, 0, canvas.width * 0.35, canvas.height * 0.2)
    ctx.fillRect(canvas.width * 0.2, canvas.height * 0.4, canvas.width * 0.2, canvas.height * 0.2)

    ctx.beginPath()
    ctx.moveTo(canvas.width * 0.5, canvas.height)
    ctx.lineTo(canvas.width * 0.6, canvas.height)
    ctx.lineTo(canvas.width * 0.7, canvas.height * 0.6)
    ctx.lineTo(canvas.width * 0.8, canvas.height)
    ctx.lineTo(canvas.width, canvas.height)
    ctx.lineTo(canvas.width * 0.8, canvas.height * 0.4)
    ctx.lineTo(canvas.width * 0.6, canvas.height * 0.4)
    ctx.lineTo(canvas.width * 0.4, canvas.height)
    ctx.lineTo(canvas.width * 0.5, canvas.height)
    ctx.fill()
    ctx.fillRect(canvas.width * 0.5, canvas.height * 0.8, canvas.width * 0.35, canvas.height * 0.1)
}

function styleIconDrawFunction(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    ctx.fillRect(5, 5, 6, 6)
    ctx.fillRect(13, 13, 6, 6)
    ctx.fillStyle = "darkGray"
    ctx.fillRect(5, 13, 6, 6)
    ctx.fillRect(13, 5, 6, 6)
}

function themeIconDrawFunction(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "darkgray"
    ctx.fillRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    ctx.strokeStyle = "black"
    ctx.moveTo(0, canvas.height)
    ctx.lineTo(0.2 * canvas.width, canvas.height * 0.6)
    ctx.lineTo(0.25 * canvas.width, canvas.height * 0.8)
    ctx.lineTo(0.5 * canvas.width, canvas.height * 0.25)
    ctx.lineTo(0.75 * canvas.width, canvas.height * 0.8)
    ctx.lineTo(0.8 * canvas.width, canvas.height * 0.6)
    ctx.lineTo(canvas.width, canvas.height)
    ctx.lineTo(0, canvas.height)
    ctx.stroke()
    ctx.fill()
}

function rightDirectionMarker(canvas) {
    var ctx = canvas.getContext("2d");
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.lineWidth = 2
    ctx.strokeStyle = borderColor
    ctx.fillStyle = accentColor
    ctx.moveTo(0, canvas.height * 0.5)
    ctx.lineTo(canvas.width, canvas.height * 0.5)
    ctx.lineTo(canvas.width * 0.5, canvas.height * 0.75)
    ctx.lineTo(canvas.width * 0.5, canvas.height * 0.25)
    ctx.lineTo(canvas.width, canvas.height * 0.5)
    ctx.stroke()
    ctx.fill()
}

function inboundTransitionIcon(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    ctx.fillRect(canvas.width * 0.8, 0, canvas.width * 0.2, canvas.height)
    ctx.fillStyle = "darkGray"
    ctx.moveTo(0, canvas.height * 0.3)
    ctx.lineTo(0, canvas.height * 0.7)
    ctx.lineTo(canvas.width * 0.4, canvas.height * 0.7)
    ctx.lineTo(canvas.width * 0.4, canvas.height * 0.8)
    ctx.lineTo(canvas.width * 0.8, canvas.height * 0.5)
    ctx.lineTo(canvas.width * 0.4, canvas.height * 0.2)
    ctx.lineTo(canvas.width * 0.4, canvas.height * 0.3)
    ctx.lineTo(0, canvas.height * 0.3)
    ctx.fill()
    ctx.stroke()
}

function outboundTransitionIcon(canvas) {
    var ctx = canvas.getContext("2d")
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = "gray"
    ctx.fillRect(0, 0, canvas.width * 0.2, canvas.height)
    ctx.fillStyle = "darkGray"
    ctx.moveTo(canvas.width * 0.2, canvas.height * 0.3)
    ctx.lineTo(canvas.width * 0.2, canvas.height * 0.7)
    ctx.lineTo(canvas.width * 0.6, canvas.height * 0.7)
    ctx.lineTo(canvas.width * 0.6, canvas.height * 0.8)
    ctx.lineTo(canvas.width, canvas.height * 0.5)
    ctx.lineTo(canvas.width * 0.6, canvas.height * 0.2)
    ctx.lineTo(canvas.width * 0.6, canvas.height * 0.3)
    ctx.lineTo(canvas.width * 0.2, canvas.height * 0.3)
    ctx.fill()
    ctx.stroke()
}

function treeNodeConnection(canvas, last, connectionY) {
    var ctx = canvas.getContext("2d");
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.lineWidth = 1
    ctx.lineCap = "round"
    ctx.lineJoin = "round"
    ctx.strokeStyle = "#a8a8a8"
    ctx.beginPath()
    ctx.moveTo(canvas.width * 0.25, 0)
    if (last)
        ctx.lineTo(canvas.width * 0.25, connectionY)
    else
        ctx.lineTo(canvas.width * 0.25, canvas.height)
    ctx.moveTo(canvas.width * 0.25, connectionY)
    ctx.lineTo(canvas.width, connectionY)
    ctx.stroke()
}

function selectionTick(canvas) {
    var ctx = canvas.getContext("2d");
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.lineWidth = 3
    ctx.lineCap = "round"
    ctx.lineJoin = "round"
    ctx.strokeStyle = highlightColor
    ctx.beginPath()
    ctx.moveTo(canvas.width * 0.2, canvas.height * 0.5)
    ctx.lineTo(canvas.width * 0.5, canvas.height * 0.8)
    ctx.lineTo(canvas.width * 0.8, canvas.height * 0.2)
    ctx.stroke()
}

function indirectSelectionTick(canvas) {
    var ctx = canvas.getContext("2d");
    ctx.clearRect(0, 0, canvas.width, canvas.height)
    ctx.fillStyle = highlightColor
    ctx.fillRect(canvas.width * 0.2, canvas.height * 0.2, canvas.width * 0.6, canvas.height * 0.6)
}
