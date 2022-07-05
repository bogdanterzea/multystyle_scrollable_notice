sub init()
end sub

function onKeyEvent(key as String, press as Boolean) as boolean
    if press
        if(key = "back")
            parent = m.top.getparent()
            lastChild = parent.getChildCount()-1
            parent.removeChildIndex(lastChild)
            button = parent.findNode("button")
            button.setFocus(true)
        end if
    end if
    return true
end function
