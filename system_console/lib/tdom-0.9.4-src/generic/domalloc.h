/*---------------------------------------------------------------------------
|   Copyright (C) 1999-2000  Jochen C. Loewer (loewerj@hotmail.com)
+----------------------------------------------------------------------------
|
|   A special memory allocator, which uses preallocated / bit masked
|   based administration of memory block with fixed sizes, like
|   DOM nodes. This will hopefully save some memory.
|
|
|   The contents of this file are subject to the Mozilla Public License
|   Version 2.0 (the "License"); you may not use this file except in
|   compliance with the License. You may obtain a copy of the License at
|   http://www.mozilla.org/MPL/
|
|   Software distributed under the License is distributed on an "AS IS"
|   basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
|   License for the specific language governing rights and limitations
|   under the License.
|
|   The Original Code is tDOM.
|
|   The Initial Developer of the Original Code is Jochen Loewer
|   Portions created by Jochen Loewer are Copyright (C) 1998, 1999
|   Jochen Loewer. All Rights Reserved.
|
|   Contributor(s):
|
|
|   written by Jochen Loewer
|   October, 2000
|
\--------------------------------------------------------------------------*/

void   domAllocInit(void);
void * domAlloc(int size);
void   domFree(void *mem);

