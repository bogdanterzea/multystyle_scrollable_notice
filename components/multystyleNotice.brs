sub init()
end sub

function onKeyEvent(key as String, press as Boolean) as boolean
    if press
        if(key = "back")
            goBackTo("button")
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