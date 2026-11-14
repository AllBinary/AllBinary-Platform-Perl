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

package org::allbinary::layer::NullLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::Layer';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::layer::NullLayer'->new() };


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::layer::NullLayer::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new(0, 0);
        # super(...) made $self above
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use javax::microedition::lcdui::Graphics ();
use org::allbinary::layer::Layer ();

1;

