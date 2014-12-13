// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'NetworkTCP.pas' rev: 6.00

#ifndef NetworkTCPHPP
#define NetworkTCPHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <WinSock.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Networktcp
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TSimpleTCPClient;
typedef void __fastcall (__closure *TSimpleTCPAcceptEvent)(System::TObject* Sender, TSimpleTCPClient* Client, bool &Accept);

typedef void __fastcall (__closure *TSimpleTCPServerEvent)(System::TObject* Sender, TSimpleTCPClient* Client);

typedef void __fastcall (__closure *TSimpleTCPServerDataAvailEvent)(System::TObject* Sender, TSimpleTCPClient* Client, int DataSize);

typedef void __fastcall (__closure *TSimpleTCPClientDataAvailEvent)(System::TObject* Sender, int DataSize);

typedef void __fastcall (__closure *TSimpleTCPServerIOEvent)(System::TObject* Sender, TSimpleTCPClient* Client, Classes::TStream* Stream);

typedef void __fastcall (__closure *TSimpleTCPClientIOEvent)(System::TObject* Sender, Classes::TStream* Stream);

typedef void __fastcall (__closure *TSimpleTCPErrorEvent)(System::TObject* Sender, int Socket, int ErrorCode, const AnsiString ErrorMsg);

class DELPHICLASS TProofList;
class PASCALIMPLEMENTATION TProofList : public Classes::TList 
{
	typedef Classes::TList inherited;
	
public:
	virtual void __fastcall Clear(void);
public:
	#pragma option push -w-inl
	/* TList.Destroy */ inline __fastcall virtual ~TProofList(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TProofList(void) : Classes::TList() { }
	#pragma option pop
	
};


class DELPHICLASS TTimerComponent;
class PASCALIMPLEMENTATION TTimerComponent : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	unsigned FHandle;
	
protected:
	bool FMonitorActive;
	int FMonitorInterval;
	virtual void __fastcall Loaded(void);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	virtual void __fastcall UpdateTimer(void);
	virtual bool __fastcall CanSetTimer(void);
	virtual void __fastcall DoTimer(void);
	void __fastcall SetMonitorActive(bool Value);
	void __fastcall SetMonitorInterval(int Value);
	__property bool MonitorActive = {read=FMonitorActive, write=SetMonitorActive, nodefault};
	__property int MonitorInterval = {read=FMonitorInterval, write=SetMonitorInterval, nodefault};
	
public:
	__fastcall virtual TTimerComponent(Classes::TComponent* aOwner);
	__fastcall virtual ~TTimerComponent(void);
	__property unsigned Handle = {read=FHandle, nodefault};
};


class DELPHICLASS TCustomSocket1;
class PASCALIMPLEMENTATION TCustomSocket1 : public TTimerComponent 
{
	typedef TTimerComponent inherited;
	
private:
	bool FActive;
	bool FAllowChangeHostAndPortOnConnection;
	AnsiString FHost;
	Word FPort;
	int FSocket;
	TSimpleTCPErrorEvent FOnError;
	TProofList* FConnections;
	void *FReceiverBuffer;
	int FReceiverDataSize;
	int FReceiverBufferSize;
	sockaddr_in SockAddrIn;
	hostent *HostEnt;
	int __fastcall GetIP(void);
	void __fastcall SetIP(int Value);
	MESSAGE void __fastcall UMTCPSelect(Messages::TMessage &Msg);
	int __fastcall SendBufferTo(TCustomSocket1* CSocket, char * Buffer, int BufSize);
	int __fastcall SendStreamTo(TCustomSocket1* CSocket, Classes::TStream* Stream);
	int __fastcall ReceiveFrom(TCustomSocket1* CSocket, char * Buffer, int BufSize, bool ReceiveCompletely);
	int __fastcall ReceiveStreamFrom(TCustomSocket1* CSocket, Classes::TStream* Stream, int DataSize, bool ReceiveCompletely);
	
protected:
	virtual void __fastcall Loaded(void);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	virtual void __fastcall SocketError(int Socket, int ErrorCode);
	virtual void __fastcall SetActive(bool Value);
	virtual void __fastcall SetHost(const AnsiString Value);
	virtual void __fastcall SetPort(Word Value);
	virtual void __fastcall DoActivate(void) = 0 ;
	virtual void __fastcall DoDeactivate(void);
	virtual void __fastcall DoConnectAccept(void) = 0 ;
	virtual void __fastcall DoClose(int Socket) = 0 ;
	virtual void __fastcall DoDataAvailable(TCustomSocket1* CSocket, int DataSize, bool &Handled) = 0 ;
	virtual void __fastcall DoRead(TCustomSocket1* CSocket, Classes::TStream* Stream) = 0 ;
	__property bool Active = {read=FActive, write=SetActive, stored=false, nodefault};
	
public:
	__fastcall virtual TCustomSocket1(Classes::TComponent* aOwner);
	__fastcall virtual ~TCustomSocket1(void);
	__property bool AllowChangeHostAndPortOnConnection = {read=FAllowChangeHostAndPortOnConnection, write=FAllowChangeHostAndPortOnConnection, default=0};
	__property AnsiString Host = {read=FHost, write=SetHost};
	__property Word Port = {read=FPort, write=SetPort, default=0};
	__property int Socket = {read=FSocket, write=FSocket, nodefault};
	__property int IP = {read=GetIP, write=SetIP, nodefault};
	__property TSimpleTCPErrorEvent OnError = {read=FOnError, write=FOnError};
};


class DELPHICLASS TSimpleTCPServer;
class PASCALIMPLEMENTATION TSimpleTCPServer : public TCustomSocket1 
{
	typedef TCustomSocket1 inherited;
	
private:
	TSimpleTCPAcceptEvent FOnAccept;
	TSimpleTCPServerEvent FOnClientConnected;
	TSimpleTCPServerEvent FOnClientDisconnected;
	TSimpleTCPServerDataAvailEvent FOnClientDataAvailable;
	TSimpleTCPServerIOEvent FOnClientRead;
	AnsiString __fastcall GetLocalHostName();
	AnsiString __fastcall GetLocalIP();
	void __fastcall SetNoneStr(const AnsiString Value);
	
protected:
	virtual void __fastcall SocketError(int Socket, int ErrorCode);
	virtual void __fastcall DoActivate(void);
	virtual void __fastcall DoDeactivate(void);
	virtual void __fastcall DoConnectAccept(void);
	virtual void __fastcall DoClose(int Socket);
	virtual void __fastcall DoDataAvailable(TCustomSocket1* CSocket, int DataSize, bool &Handled);
	virtual void __fastcall DoRead(TCustomSocket1* CSocket, Classes::TStream* Stream);
	
public:
	__fastcall virtual TSimpleTCPServer(Classes::TComponent* aOwner);
	__fastcall virtual ~TSimpleTCPServer(void);
	int __fastcall Send(TSimpleTCPClient* Client, char * Buffer, int BufSize);
	int __fastcall SendStream(TSimpleTCPClient* Client, Classes::TStream* Stream);
	void __fastcall Broadcast(char * Buffer, int BufSize);
	void __fastcall BroadcastStream(Classes::TStream* Stream);
	int __fastcall Receive(TSimpleTCPClient* Client, char * Buffer, int BufSize, bool ReceiveCompletely);
	bool __fastcall ReceiveHard(TSimpleTCPClient* Client, char * Buffer, int BufSize);
	int __fastcall ReceiveStream(TSimpleTCPClient* Client, Classes::TStream* Stream, int DataSize, bool ReceiveCompletely);
	bool __fastcall ReceiveStreamHard(TSimpleTCPClient* Client, Classes::TStream* Stream, int DataSize);
	__property TProofList* Connections = {read=FConnections};
	
__published:
	__property bool Listen = {read=FActive, write=SetActive, default=0};
	__property AnsiString LocalHostName = {read=GetLocalHostName, write=SetNoneStr, stored=false};
	__property AnsiString LocalIP = {read=GetLocalIP, write=SetNoneStr, stored=false};
	__property TSimpleTCPAcceptEvent OnAccept = {read=FOnAccept, write=FOnAccept};
	__property TSimpleTCPServerEvent OnClientConnected = {read=FOnClientConnected, write=FOnClientConnected};
	__property TSimpleTCPServerEvent OnClientDisconnected = {read=FOnClientDisconnected, write=FOnClientDisconnected};
	__property TSimpleTCPServerDataAvailEvent OnClientDataAvailable = {read=FOnClientDataAvailable, write=FOnClientDataAvailable};
	__property TSimpleTCPServerIOEvent OnClientRead = {read=FOnClientRead, write=FOnClientRead};
	__property AllowChangeHostAndPortOnConnection  = {default=0};
	__property Port  = {default=0};
	__property OnError ;
};


class PASCALIMPLEMENTATION TSimpleTCPClient : public TCustomSocket1 
{
	typedef TCustomSocket1 inherited;
	
private:
	bool FAutoReconnect;
	bool FConnected;
	Classes::TNotifyEvent FOnConnected;
	Classes::TNotifyEvent FOnDisconnected;
	Classes::TNotifyEvent FOnConnectionLost;
	TSimpleTCPClientDataAvailEvent FOnDataAvailable;
	TSimpleTCPClientIOEvent FOnRead;
	bool __fastcall GetConnected(void);
	
protected:
	virtual void __fastcall DoTimer(void);
	virtual void __fastcall SocketError(int Socket, int ErrorCode);
	virtual void __fastcall SetActive(bool Value);
	virtual void __fastcall DoActivate(void);
	virtual void __fastcall DoDeactivate(void);
	virtual void __fastcall DoConnectAccept(void);
	virtual void __fastcall DoClose(int Socket);
	virtual void __fastcall DoDataAvailable(TCustomSocket1* CSocket, int DataSize, bool &Handled);
	virtual void __fastcall DoRead(TCustomSocket1* CSocket, Classes::TStream* Stream);
	virtual void __fastcall DoConnectionLost(void);
	
public:
	bool bCreated;
	__fastcall virtual TSimpleTCPClient(Classes::TComponent* aOwner);
	void __fastcall Connect(void);
	void __fastcall Disconnect(void);
	int __fastcall Send(char * Buffer, int BufSize);
	int __fastcall SendStream(Classes::TStream* Stream);
	int __fastcall Receive(char * Buffer, int BufSize, bool ReceiveCompletely);
	bool __fastcall ReceiveHard(char * Buffer, int BufSize);
	int __fastcall ReceiveStream(Classes::TStream* Stream, int DataSize, bool ReceiveCompletely);
	bool __fastcall ReceiveStreamHard(Classes::TStream* Stream, int DataSize);
	
__published:
	__property bool AutoReconnect = {read=FAutoReconnect, write=FAutoReconnect, default=0};
	__property int AutoReconnectInterval = {read=FMonitorInterval, write=SetMonitorInterval, default=20000};
	__property bool Connected = {read=GetConnected, write=SetActive, default=0};
	__property Classes::TNotifyEvent OnConnected = {read=FOnConnected, write=FOnConnected};
	__property Classes::TNotifyEvent OnDisconnected = {read=FOnDisconnected, write=FOnDisconnected};
	__property Classes::TNotifyEvent OnConnectionLost = {read=FOnConnectionLost, write=FOnConnectionLost};
	__property TSimpleTCPClientDataAvailEvent OnDataAvailable = {read=FOnDataAvailable, write=FOnDataAvailable};
	__property TSimpleTCPClientIOEvent OnRead = {read=FOnRead, write=FOnRead};
	__property AllowChangeHostAndPortOnConnection  = {default=0};
	__property Host ;
	__property Port  = {default=0};
	__property OnError ;
public:
	#pragma option push -w-inl
	/* TCustomSocket1.Destroy */ inline __fastcall virtual ~TSimpleTCPClient(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Word UM_TCPASYNCSELECT = 0x401;
static const Word DEF_RECONNECT_INTERVAL = 0x4e20;
extern PACKAGE AnsiString __fastcall IPToStr(int IP);
extern PACKAGE int __fastcall StrToIP(AnsiString Host);
extern PACKAGE void __fastcall Register(void);

}	/* namespace Networktcp */
using namespace Networktcp;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// NetworkTCP
