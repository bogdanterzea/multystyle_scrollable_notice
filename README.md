# Roku Multistyle Scrollable Notice Screen
ScrollableNotice implementation using a MultistyleLabel, allowing you to use multiple fonts, sizes and colors.

## Installation
The MultistyleNotice component should be stored in `/components` directory. To do so, copy the content of the current `package/components/multystylenotice.*`

### How to use MultistyleNotice:
- Create your Roku channel application
- Add MultyStyleNotice component to the screen

#### Example:
##### Code example
```
noticeScreen = createObject("roSGNode", "MultystyleNotice")
noticeTitleContent = "Put the screen title in here"
noticeTextContent = "The main <DrawingFontExample>notice text</DrawingFontExample> should be placed in here"
noticeDrawingStyles = {
    "DrawingFontExample": {
        "fontSize": "32"
        "fontUri": "pkg:/fonts/CustomF.otf"
        "color": "#FF0000FF"
    }
}
noticeScreen.content = {titleContent: noticeTitleContent, textContent: noticeTextContent, drawingStyles = noticeDrawingStyles}
m.top.append(noticeScreen)
```
##### Code explanation

The notice title, text, and drawing styles should be grouped into a `roAssociativeArray` as seen in the code example. This array will be set as the `noticeScreen.content` in order to render the text on the screen.  `textContent` is a string that will be assigned to a `MultistyleLabel` so feel free to build it accordingly to the `MultistyleLabel.text` format, using the proper tags that are defined within the `drawingStyle`.

##### The following fields can be set inside the MultistyleNotice content:
| Field | Type | Default Value |
| :------------ | :------------ | :------------ |
| titleContent | STRING | "" |
| textContent | STRING | "" |
| drawingStyles | roAssociativeArray | {} |

## How to use the Sample Project
- Download the `multystyle_scrollable_notice` package to your machine
- Archive the content of the package into a `*.zip` file
- Navigate to the YOU-ROKU-DEVICE-IP using the browser
- Surf to the installer page
- Upload and install the `.zip` file
- Once the application finishes installing, hit the `OK` button on the Remove in order to display the MultistyleNotice screen

## License
This library is licensed under the MIT License. See the [LICENSE](https://github.com/bogdanterzea/multystyle_scrollable_notice/blob/master/LICENSE.md) for details.