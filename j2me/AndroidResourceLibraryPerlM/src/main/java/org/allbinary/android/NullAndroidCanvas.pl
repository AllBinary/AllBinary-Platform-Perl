# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::android::NullAndroidCanvas;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $NULL_CANVAS, 'java::lang::LazyStatic', sub { 'android::graphics::Canvas'->new() };
tie our $NULL_MEDIA_PLAYER, 'java::lang::LazyStatic', sub { 'android::media::MediaPlayer'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use android::graphics::Canvas ();
# use android::media::MediaPlayer ();

1;

