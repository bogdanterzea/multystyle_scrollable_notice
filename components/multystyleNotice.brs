sub init()
    m.BACK_BUTTON_INDEX = 2
    m.BUTTON_ON_FOCUS = m.BACK_BUTTON_INDEX

    m.navigation = m.top.findNode("navigation")
    m.titleContent = m.top.findNode("titleContent")
    m.noticeContent = m.top.findNode("noticeContent")
    
    initObservers()
    initTheme()
end sub

sub initObservers()
    m.navigation.getChild(m.BACK_BUTTON_INDEX).observeField("buttonSelected", "onBackButtonSelected")
end sub

sub initTheme()
    m.titleContent.font = "font:LargeBoldSystemFont"
    m.titleContent.font.size = 32
end sub

sub onBackButtonSelected()
    goBackTo("button")
end sub

sub onContentChange(event as Object)
    contentData = event.getData()
    m.noticeContent.text = contentData 
end sub

sub onTitleChange(event as Object)
    titleData = event.getData()
    m.titleContent.text = titleData
end sub

function onKeyEvent(key as String, press as Boolean) as boolean
    firstButtonIndex = 0
    
    if press
        if key = "back"
            goBackTo("button")
        else if key = "left" and m.BUTTON_ON_FOCUS <> firstButtonIndex
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
