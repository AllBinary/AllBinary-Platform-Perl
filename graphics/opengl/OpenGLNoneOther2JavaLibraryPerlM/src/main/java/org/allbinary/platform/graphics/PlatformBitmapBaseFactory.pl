# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
#  
# By agreeing to this license you and any business entity you represent are 
# legally bound to the AllBinary Open License Version 1 legal agreement. 
#  
# You may obtain the AllBinary Open License Version 1 legal agreement from 
# AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
#  
# Created By: Travis Berthelot 
#   
# Generated Code Do Not Modify

package org::allbinary::platform::graphics::PlatformBitmapBaseFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $NULL_PLATFORM_BITMAP_BASE_FACTORY, 'java::lang::LazyStatic', sub { 'org::allbinary::platform::graphics::PlatformBitmapBaseFactory'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub createBitmap {
    my ($self, $image) = @_;
        return $org::allbinary::platform::graphics::PlatformBitmapBase::NULL_PLATFORM_BITMAP_BASE;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use javax::microedition::lcdui::Image ();
use org::allbinary::platform::graphics::PlatformBitmapBase ();

1;

