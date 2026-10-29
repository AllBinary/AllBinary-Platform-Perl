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

package org::allbinary::game::input::PlatformKeyFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::input::PlatformKeyFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::input::PlatformKeyFactory::instance = 'org::allbinary::game::input::PlatformKeyFactory'->new();
        }
        return $org::allbinary::game::input::PlatformKeyFactory::instance;
}


sub getString {
    my ($self, $keyCode) = @_;
        return 'org::allbinary::game::input::J2MEGameKey'->getString($keyCode);
}


sub isSubmission {
    my ($self, $input) = @_;
        return 'org::allbinary::game::input::J2MEKeyFactory'->getInstance()->isSubmission($input);
}


sub isDelete {
    my ($self, $input) = @_;
        return 'org::allbinary::game::input::J2MEKeyFactory'->getInstance()->isDelete($input);
}


sub isBackSpace {
    my ($self, $input) = @_;
        return 'org::allbinary::game::input::J2MEKeyFactory'->getInstance()->isBackSpace($input);
}


sub isLeft {
    my ($self, $input) = @_;
        return 'org::allbinary::game::input::J2MEKeyFactory'->getInstance()->isLeft($input);
}


sub isRight {
    my ($self, $input) = @_;
        return 'org::allbinary::game::input::J2MEKeyFactory'->getInstance()->isRight($input);
}


sub isUp {
    my ($self, $input) = @_;
        return 'org::allbinary::game::input::J2MEKeyFactory'->getInstance()->isUp($input);
}


sub isDown {
    my ($self, $input) = @_;
        return 'org::allbinary::game::input::J2MEKeyFactory'->getInstance()->isDown($input);
}


sub isEnter {
    my ($self, $input) = @_;
        return 'org::allbinary::game::input::J2MEKeyFactory'->getInstance()->isEnter($input);
}

use org::allbinary::logic::NullUtil;
use org::allbinary::game::input::J2MEGameKey;
use org::allbinary::game::input::J2MEKeyFactory;

1;

