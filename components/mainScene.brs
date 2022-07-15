sub init()
    m.button = m.top.findNode("button")
    m.top.setFocus(true)

    m.button.observeField("buttonSelected", "onButtonSelectedChanged")

    setInterface()
end sub

sub populateNoticeScreen(noticeScreen as Object)
    contentFilePath = "pkg:\displayText.json"

    fileContent = ParseJson(ReadAsciiFile(contentFilePath))
    noticeTitle = fileContent.title
    noticeText = fileContent.noticeContent

    noticeScreen.content = createContentDictionary(noticeTitle, noticeText)
end sub

sub createContentDictionary(noticeTitle as String, noticeText as String) as Dynamic
    content = {titleContent: noticeTitle, textContent: noticeText}
    content.drawingStyles = createDrawingStyles()

    return content
end sub

function createDrawingStyles() as Object
    drawingStyles = {
        "DrawingFontExample": {
            "fontSize": "32"
            "fontUri": "pkg:/images/CustomF.otf"
            "color": "#FF0000FF"
        }
    }
    
    return drawingStyles
end function

sub setInterface()
    m.top.backgroundURI = "pkg:/images/background.jpg"
    alignToCenter(m.button)
end sub

sub alignToCenter(component as Object)
    boundingRect = component.boundingRect()
    centerx = (1280 - boundingRect.width) / 2
    centery = (720 - boundingRect.height) / 2
    component.translation = [ centerx, centery ]
end sub

sub onButtonSelectedChanged()
    noticeScreen = createObject("roSgNode", "MultystyleNotice")
    populateNoticeScreen(noticeScreen)
    m.top.appendChild(noticeScreen)
    noticeScreen.setFocus(true)
end sub
