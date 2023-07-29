#pragma once
//
// Copyright (c) .NET Foundation and Contributors
// See LICENSE file in the project root for full license information.
//
///////////////////////////////////////////////////////////////////////////////////////////
// Define various build options for the ThreadX port.  The application should either make changes
// here by commenting or un-commenting the conditional compilation defined OR supply the defines
// though the compiler's equivalent of the -D option.



// 10 Milliseonds tick rate for scheduling ( Normal Default)
#define TX_TIMER_TICKS_PER_SECOND 100

