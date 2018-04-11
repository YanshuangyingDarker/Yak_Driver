//
//  FontAndColorMacros.h
//  Yak_Driver
//
//  Created by charlie on 2018/4/11.
//  Copyright © 2018年 Charlie. All rights reserved.
//

#ifndef FontAndColorMacros_h
#define FontAndColorMacros_h

//字体
#define OVERSTRIKING     @"Helvetica-Bold"
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define OVERSTRIKINGFONT(FONTSIZE)    [UIFont fontWithName:(OVERSTRIKING) size:(FONTSIZE)]

#endif /* FontAndColorMacros_h */
