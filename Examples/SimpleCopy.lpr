program SimpleCopy;

{$mode objfpc}{$H+}

uses BobStream, Classes;

var Lib: TBobBufsWorkerLib; InS, OutS: TFileStream;
begin
  Lib := TBobBufsWorkerLib.Create;
  InS := TFileStream.Create('input.bin', fmOpenRead);
  OutS := TFileStream.Create('output.bin', fmCreate);
  Lib.BlockCopyer(InS, OutS);  // ← 3行，11GB/s
end.
