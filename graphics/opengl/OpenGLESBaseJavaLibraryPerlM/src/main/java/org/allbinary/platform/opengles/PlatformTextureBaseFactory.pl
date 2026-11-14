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

package org::allbinary::platform::opengles::PlatformTextureBaseFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $NULL_PLATFORM_TEXTURE_BASE_FACTORY, 'java::lang::LazyStatic', sub { 'org::allbinary::platform::opengles::PlatformTextureBaseFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub load {
    my ($self, $gl, $target, $level, $image, $border, $flip) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use javax::microedition::khronos::opengles::GL10 ();
use javax::microedition::lcdui::Image ();
use org::allbinary::string::CommonStrings ();

1;

