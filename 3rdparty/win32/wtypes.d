/***********************************************************************\
*                               wtypes.d                                *
*                                                                       *
*                       Windows API header module                       *
*                                                                       *
*                 Translated from MinGW Windows headers                 *
*                                                                       *
*                       Placed into public domain                       *
\***********************************************************************/
module win32.wtypes;
version(Windows):

import win32.rpc, win32.rpcndr;
private import win32.windef;
private import win32.uuid; // for GUID_NULL

alias GUID_NULL IID_NULL, CLSID_NULL;

const ROTFLAGS_REGISTRATIONKEEPSALIVE = 0x01;
const ROTFLAGS_ALLOWANYCLIENT         = 0x02;

// also in winsock2.h
struct BLOB {
	ULONG cbSize;
	BYTE* pBlobData;
}
alias BLOB* PBLOB, LPBLOB;

enum DVASPECT {
	DVASPECT_CONTENT   = 1,
	DVASPECT_THUMBNAIL = 2,
	DVASPECT_ICON      = 4,
	DVASPECT_DOCPRINT  = 8
}

enum DVASPECT2 {
	DVASPECT_OPAQUE      = 16,
	DVASPECT_TRANSPARENT = 32
}

enum STATFLAG {
	STATFLAG_DEFAULT = 0,
	STATFLAG_NONAME  = 1
}

enum MEMCTX {
	MEMCTX_LOCAL = 0,
	MEMCTX_TASK,
	MEMCTX_SHARED,
	MEMCTX_MACSYSTEM,
	MEMCTX_UNKNOWN = -1,
	MEMCTX_SAME = -2
}

enum MSHCTX {
	MSHCTX_LOCAL = 0,
	MSHCTX_NOSHAREDMEM,
	MSHCTX_DIFFERENTMACHINE,
	MSHCTX_INPROC,
	MSHCTX_CROSSCTX
}

enum CLSCTX {
	CLSCTX_INPROC_SERVER   = 1,
	CLSCTX_INPROC_HANDLER  = 2,
	CLSCTX_LOCAL_SERVER    = 4,
	CLSCTX_INPROC_SERVER16 = 8,
	CLSCTX_REMOTE_SERVER   = 16
}

enum MSHLFLAGS {
	MSHLFLAGS_NORMAL,
	MSHLFLAGS_TABLESTRONG,
	MSHLFLAGS_TABLEWEAK
}

struct FLAGGED_WORD_BLOB {
	uint fFlags;
	uint clSize;
	ushort[1] asData;
}

alias WCHAR OLECHAR;
alias LPWSTR LPOLESTR;
alias LPCWSTR LPCOLESTR;

alias ushort VARTYPE;
alias short VARIANT_BOOL;
alias VARIANT_BOOL _VARIANT_BOOL;
const VARIANT_BOOL VARIANT_TRUE = -1; // 0xffff;
const VARIANT_BOOL VARIANT_FALSE = 0;

alias OLECHAR* BSTR;
alias FLAGGED_WORD_BLOB* wireBSTR;
alias BSTR* LPBSTR;
//alias LONG SCODE; // also in winerror
mixin DECLARE_HANDLE!("HCONTEXT");
mixin DECLARE_HANDLE!("HMETAFILEPICT");

union CY {
	struct {
		uint Lo;
		int Hi;
	}
	LONGLONG int64;
}

alias double DATE;
struct  BSTRBLOB {
	ULONG cbSize;
	PBYTE pData;
}
alias BSTRBLOB* LPBSTRBLOB;

// Used only in the PROPVARIANT structure
// According to the 2003 SDK, this should be in propidl.h, not here.
struct CLIPDATA {
	ULONG cbSize;
	int ulClipFmt;
	PBYTE pClipData;
}

enum STGC {
	STGC_DEFAULT,
	STGC_OVERWRITE,
	STGC_ONLYIFCURRENT,
	STGC_DANGEROUSLYCOMMITMERELYTODISKCACHE
}

enum STGMOVE {
	STGMOVE_MOVE,
	STGMOVE_COPY,
	STGMOVE_SHALLOWCOPY
}

enum VARENUM {
	VT_EMPTY,
	VT_NULL,
	VT_I2,
	VT_I4,
	VT_R4,
	VT_R8,
	VT_CY,
	VT_DATE,
	VT_BSTR,
	VT_DISPATCH,
	VT_ERROR,
	VT_BOOL,
	VT_VARIANT,
	VT_UNKNOWN,
	VT_DECIMAL,
	VT_I1 = 16,
	VT_UI1,
	VT_UI2,
	VT_UI4,
	VT_I8,
	VT_UI8,
	VT_INT,
	VT_UINT,
	VT_VOID,
	VT_HRESULT,
	VT_PTR,
	VT_SAFEARRAY,
	VT_CARRAY,
	VT_USERDEFINED,
	VT_LPSTR,
	VT_LPWSTR,
	VT_RECORD   = 36,
	VT_INT_PTR  = 37,
	VT_UINT_PTR = 38,
	VT_FILETIME = 64,
	VT_BLOB,
	VT_STREAM,
	VT_STORAGE,
	VT_STREAMED_OBJECT,
	VT_STORED_OBJECT,
	VT_BLOB_OBJECT,
	VT_CF,
	VT_CLSID,
	VT_BSTR_BLOB     = 0xfff,
	VT_VECTOR        = 0x1000,
	VT_ARRAY         = 0x2000,
	VT_BYREF         = 0x4000,
	VT_RESERVED      = 0x8000,
	VT_ILLEGAL       = 0xffff,
	VT_ILLEGALMASKED = 0xfff,
	VT_TYPEMASK      = 0xfff
};

struct BYTE_SIZEDARR {
	uint clSize;
	byte* pData;
}

struct WORD_SIZEDARR {
	uint clSize;
	ushort* pData;
}

struct DWORD_SIZEDARR {
uint clSize;
uint* pData;
}

struct HYPER_SIZEDARR {
	uint clSize;
	hyper* pData;
}

alias double DOUBLE;


struct DECIMAL {
	USHORT wReserved;
	union {
		struct {
			ubyte scale; // valid values are 0 to 28
			ubyte sign; // 0 for positive, DECIMAL_NEG for negatives.
			enum ubyte DECIMAL_NEG = 0x80;
		}
		USHORT signscale;
	}
	ULONG Hi32;
	union {
		struct {
			ULONG Lo32;
			ULONG Mid32;
		}
		ULONGLONG Lo64;
	}
	// #define DECIMAL_SETZERO(d) {(d).Lo64=(d).Hi32=(d).signscale=0;}
	void setZero() { Lo64 = 0; Hi32 = 0; signscale = 0; }
}
