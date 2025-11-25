program Test_CopySpeed;

{$mode objfpc}{$H+}

uses
  Classes, SysUtils, BobStream, Windows; // Windows for QueryPerformance

var
  Lib: TBobBufsWorkerLib;
  Input, Output: TMemoryStream;
  Start, EndTime: Int64;
  Freq: Int64;
begin
  QueryPerformanceFrequency(Freq);
  Input := TMemoryStream.Create;
  Output := TMemoryStream.Create;
  Input.LoadFromFile('test_1GB.bin'); // 准备1GB测试文件

  Lib := TBobBufsWorkerLib.Create;
  QueryPerformanceCounter(Start);
  Lib.BlockCopyer(Input, Output);
  QueryPerformanceCounter(EndTime);

  WriteLn(Format('Copy Speed: %.2f GB/s', [(Input.Size / 1024 / 1024 / 1024) / ((EndTime - Start) / Freq)]));
end.
