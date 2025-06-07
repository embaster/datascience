-- Skrypt w lua powoduje dodanie znaku nowej strony `\newpage' 
-- przed każdym, poza pierwszym, wystąpieniem Nagłówka (# ...).
-- Dzięki temu każde zadanie jest na osobnej stronie.
local first = true

function Header(el)
  if el.level == 1 then
    if first then
      first = false
      return el
    else
      return {
        pandoc.RawBlock("latex", "\\newpage"),
        el
      }
    end
  else
    return el
  end
end