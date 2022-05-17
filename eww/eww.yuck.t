(defwindow bar
  :geometry (geometry :x "0%"
                      :y "0%"
                      :width "95%"
                      :height "2%"
                      :anchor "top center")
  :stacking "fg"
  :windowtype "dock"
  :wmignore false
  (sup))

(defwidget sup []
  (box :orientation "horizontal"
       :halign "center"
       :height "10px"
    "hello"
    (button :onclick "notify-send 'hello world'")))
