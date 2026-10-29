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

package org::allbinary::game::identification::BasicGroupFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{NAME} = "GROUP_NAME";
    $self->{NO_SUCH_GROUP} = "No Such Group: ";
    $self->{GOOD} = 'org::allbinary::game::identification::Group'->new("Good Guys", ((int(0) + 32768) % 65536 - 32768));
    $self->{ENEMY} = 'org::allbinary::game::identification::Group'->new("Bad Guys", ((int(1) + 32768) % 65536 - 32768));
    $self->{ENEMY_ON_LEVEL} = 'org::allbinary::game::identification::Group'->new("Bad Guys on Level", ((int(2) + 32768) % 65536 - 32768));
    $self->{NONE} = 'org::allbinary::game::identification::Group'->new("Not On A Team", ((int(3) + 32768) % 65536 - 32768));
    $self->{GOOD_ARRAY} = [$self->{GOOD}];
    $self->{ENEMY_ARRAY} = [$self->{ENEMY}];
    $self->{ENEMY_ON_LEVEL_ARRAY} = [$self->{ENEMY}, $self->{ENEMY_ON_LEVEL}];
    $self->{NONE_ARRAY} = [$self->{NONE}];
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::identification::BasicGroupFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::identification::BasicGroupFactory::instance = 'org::allbinary::game::identification::BasicGroupFactory'->new();
        }
        return $org::allbinary::game::identification::BasicGroupFactory::instance;
}

use org::allbinary::logic::NullUtil;
use org::allbinary::game::identification::Group;

1;

