#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
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

package org::allbinary::game::layer::SWTBlackPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::Paintable';


sub _init_fields {
    my ($self) = @_;
    $self->{basicSetColorUtil} = 'org::allbinary::graphics::color::BasicColorSetUtil'->getInstance();
    $self->{BLACK} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK};
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{basicSetColorUtil}->setBasicColorP($graphics, $self->{BLACK});
}

use java::lang::Object ();
use javax::microedition::lcdui::Graphics ();
use org::allbinary::graphics::color::BasicColor ();
use org::allbinary::graphics::color::BasicColorFactory ();
use org::allbinary::graphics::color::BasicColorSetUtil ();
use org::allbinary::graphics::paint::Paintable ();

1;

