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

package org::allbinary::game::ag::layer::weapon::mine::MineWeaponResources;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::resources::BasicGameResources';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{DROP_TEXT_RESOURCE} = "/mine_drop_text_20_by_20.png";
    $self->{DROP_RESOURCE} = "/mine_drop_20_by_20.png";
    $self->{DROP_ICON_RESOURCE} = "/mine_drop_icon_20_by_20.png";
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::ag::layer::weapon::mine::MineWeaponResources::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::ag::layer::weapon::mine::MineWeaponResources::instance = 'org::allbinary::game::ag::layer::weapon::mine::MineWeaponResources'->new();
        }
        return $org::allbinary::game::ag::layer::weapon::mine::MineWeaponResources::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $ROOT = "/mine";
        my $SMALL = "_20_by_20.png";
        my $MEDIUM = $SMALL;
        my $SIZE_FOUR = $SMALL;
        my $SIZE_FIVE = $SMALL;
        my $SIZE_SIX = $SMALL;
        my $SIZE = [$SMALL, $MEDIUM, $SIZE_FOUR, $SIZE_FIVE, $SIZE_SIX];
        $self->SUPER::init($ROOT, $SIZE);
    return $self;
}

use org::allbinary::game::layer::resources::BasicGameResources;
use org::allbinary::logic::NullUtil;

1;

