// https://wiki.factorio.com/Rich_text
// [color=rgb]...[/color]
// [color=#rrggbb]...[/color]
// [color=#aarrggbb]...[/color]
// [color=rgb]...[.color]
// [color=#rrggbb]...[.color]
// [color=#aarrggbb]...[.color]
// rgb is a comma separated RGB color ranging from 0 to 1 or 0 to 255, or a color name
// Available colors: default, red, green, blue, orange, yellow, pink, purple, white, black, gray, brown, cyan, acid.
public enum ColorTextModifierColor {
    case alias(ColorTextModifierColorAlias)
    case floatRgb(r: Double, g: Double, b: Double)
    case intRgb(r: UInt8, g: UInt8, b: UInt8)
    case hexRgb(r: UInt8, g: UInt8, b: UInt8)
    case hexArgb(a: UInt8, r: UInt8, g: UInt8, b: UInt8)
}
