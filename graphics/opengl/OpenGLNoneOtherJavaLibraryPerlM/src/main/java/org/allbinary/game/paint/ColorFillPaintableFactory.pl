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

package org::allbinary::game::paint::ColorFillPaintableFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::paint::ColorFillPaintableFactory'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::paint::ColorFillPaintableFactory::instance;
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $basicColor, $forThreedCanvas) = @_;
        my $operatingSystem = 'org::allbinary::logic::system::os::OperatingSystemFactory'->getInstance()->getOperatingSystemInstance();
        if ($operatingSystem->isOverScan()) {
            return 'org::allbinary::game::paint::OverScanColorFillPaintable'->new($basicColor);
        } else {
            return 'org::allbinary::game::paint::ColorFillPaintable'->new($basicColor);
        }
}

use org::allbinary::graphics::color::BasicColor;
use org::allbinary::logic::system::os::GenericOperatingSystem;
use org::allbinary::logic::system::os::OperatingSystemFactory;
use org::allbinary::game::paint::ColorFillPaintable;
use org::allbinary::game::paint::OverScanColorFillPaintable;

1;

