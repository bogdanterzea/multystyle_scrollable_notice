sub init()
    m.PAGE_HEIGHT = 536
    m.NUMBER_OF_PAGES = 1
    m.UP_BUTTON_INDEX = 0
    m.DOWN_BUTTON_INDEX = 1
    m.BACK_BUTTON_INDEX = 2
    m.CURRENT_PAGE = m.NUMBER_OF_PAGES
    m.BUTTON_ON_FOCUS = m.BACK_BUTTON_INDEX

    m.navigation = m.top.findNode("navigation")
    m.contentMask = m.top.findNode("contentMask")
    m.pagingLabel = m.top.findNode("pagingLabel")
    m.titleContent = m.top.findNode("titleContent")
    m.noticeContent = m.top.findNode("noticeContent")

    initObservers()
    initTheme()
end sub

sub initObservers()
    m.navigation.getChild(m.UP_BUTTON_INDEX).observeField("buttonSelected", "onUpButtonSelected")
    m.navigation.getChild(m.DOWN_BUTTON_INDEX).observeField("buttonSelected", "onDownButtonSelected")
    m.navigation.getChild(m.BACK_BUTTON_INDEX).observeField("buttonSelected", "onBackButtonSelected")
end sub

sub initTheme()
    m.titleContent.font = "font:LargeBoldSystemFont"
    m.titleContent.font.size = 32
    m.pagingLabel.font.size = 18

    scaleContentMask()
end sub

sub scaleContentMask()
    widthIndex = 0
    heightIndex = 1

    scalingFactor = getMaskScalingFactor()
    scaledWidth = m.contentMask.maskSize[widthIndex] * scalingFactor
    scaledHeight = m.contentMask.maskSize[heightIndex] * scalingFactor

    m.contentMask.maskSize = [scaledWidth, scaledHeight]
end sub

function getMaskScalingFactor() as Float
    developmentResolutionHeight = 720

    deviceInfo = createObject("roDeviceInfo")
    deviceResolutionHeight = deviceInfo.GetUIResolution()["height"]

    scalingFactor = deviceResolutionHeight / developmentResolutionHeight

    return scalingFactor
end function

sub onUpButtonSelected()
    firstPage = 1
    goUpTranslationValue = 544
    if m.CURRENT_PAGE <> firstPage
        translateNoticeContentWith(goUpTranslationValue)
        m.CURRENT_PAGE -= 1
        updatePagingLabel()
    end if
end sub

sub onDownButtonSelected()
    goDownTranslationValue = -544

    if m.CURRENT_PAGE <> m.NUMBER_OF_PAGES
        translateNoticeContentWith(goDownTranslationValue)
        m.CURRENT_PAGE += 1
        updatePagingLabel()
    end if
end sub

sub onBackButtonSelected()
    goBackTo("button")
end sub

sub translateNoticeContentWith(translationValue as Integer)
    xAxisTranslationIndex = 0
    yAxisTranslationIndex = 1
    
    m.noticeContent.height -= translationValue

    contentLeftBorderTranslation = m.noticeContent.translation[xAxisTranslationIndex]
    contentTopBorderTranslation = m.noticeContent.translation[yAxisTranslationIndex]

    contentTopBorderTranslation += translationValue
    m.noticeContent.translation = [contentLeftBorderTranslation, contentTopBorderTranslation]
end sub

sub onContentChange(event as Object)
    contentData = event.getData()

    contentDictionary = createContentDictionary(contentData)

    populateNoticeData(contentDictionary)
    allignTitle()
    updatePagesNumber()
    updateNoticeContentHeight()
    updatePagingLabel()
end sub

function createContentDictionary(contentData) as Object
    contentDictionary = {
        titleContent: ""
        textContent: ""
        drawingStyles: {}
    }
    contentDictionary.append(contentData)

    return contentDictionary
end function

sub populateNoticeData(contentDictionary)
    m.titleContent.text = contentDictionary.titleContent
    m.noticeContent.text = contentDictionary.textContent
    m.noticeContent.drawingStyles = contentDictionary.drawingStyles
end sub

sub allignTitle()
    screenWidth = 1280

    titleBoundingRectangle = m.titleContent.boundingRect()
    yTranslation = 54
    xTranslation = (screenWidth - titleBoundingRectangle.width) / 2

    m.titleContent.translation = [ xTranslation, yTranslation ]
end sub

sub updatePagesNumber()
    contentBoundingRect = m.noticeContent.boundingRect()
    noticeContentHeight = contentBoundingRect["height"]
    exactPagesNumber = noticeContentHeight / m.PAGE_HEIGHT

    m.NUMBER_OF_PAGES = Int(exactPagesNumber)
    fractionalPart = exactPagesNumber - m.NUMBER_OF_PAGES

    if fractionalPart > 0 then m.NUMBER_OF_PAGES += 1
end sub

sub updateNoticeContentHeight()
    m.noticeContent.height = m.PAGE_HEIGHT
end sub

sub updatePagingLabel()
    pagingText = Substitute("Page {0}/{1}", m.CURRENT_PAGE.ToStr(), m.NUMBER_OF_PAGES.ToStr())
    m.pagingLabel.text = pagingText
end sub

function onKeyEvent(key as String, press as Boolean) as boolean
    if press
        if key = "back"
            goBackTo("button")
        else if key = "left" and m.BUTTON_ON_FOCUS <> m.UP_BUTTON_INDEX
            navigateToLeft()
        else if key = "right" and m.BUTTON_ON_FOCUS <> m.BACK_BUTTON_INDEX
            navigateToRight()
        end if
    end if

    return true
end function

sub goBackTo(componentToFocus as String)
    parent = m.top.getparent()
    lastChild = parent.getChildCount()-1
    parent.removeChildIndex(lastChild)
    button = parent.findNode(componentToFocus)
    button.setFocus(true)
end sub

sub navigateToLeft()
    m.BUTTON_ON_FOCUS -= 1

    m.navigation.getChild(m.BUTTON_ON_FOCUS).setFocus(true)
end sub

sub navigateToRight()
    m.BUTTON_ON_FOCUS += 1

    m.navigation.getChild(m.BUTTON_ON_FOCUS).setFocus(true)
end sub
