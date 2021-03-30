unit PrintBMP;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics;
  type
{ TDrawParamsRecord }
  TDrawParamsRecord = record
    PictureZoom: integer;
    Stretch: boolean;
    Center: boolean;
    KeepAspectRatio: boolean;

    OutputRect: TRect;

    //ResizeMode: TResizeMode;

     Height: integer ;
     Width: integer ;

  end;

procedure OutputToCanvas(Canvas: TCanvas; Image: TBitmap; DrawParams: TDrawParamsRecord);

implementation

procedure OutputToCanvas(Canvas: TCanvas; Image: TBitmap; DrawParams: TDrawParamsRecord);
var
  // StretchDIBits has BmpInfo passed in as a Var parameter so we can't
  // use the read only property.
  BmpInfo: TBitmapInfo;
begin

  BmpInfo := Image.BitmapInfo;


  // If th output matches the current image size then we can just move the bits,
  // no reason for "Stretch"
  if (DrawParams.Height = Image.Height) and (DrawParams.Width = Image.Width) then
  begin
    SetDIBitsToDevice(Canvas.Handle,
                      DrawParams.OutputRect.Left, DrawParams.OutputRect.Top,
                      DrawParams.Width, DrawParams.Height,
                      0, 0, 0, Image.Height, Image.Bits, BmpInfo, DIB_RGB_COLORS);

  end
  else
  begin
    StretchDIBits(Canvas.Handle,
                  DrawParams.OutputRect.Left, DrawParams.OutputRect.Top,
                  DrawParams.Width, DrawParams.Height,
                  0, 0, Image.Width, Image.Height,
                  Image.Bits, BmpInfo, DIB_RGB_COLORS, SRCCOPY);
  end;
end;

end.
