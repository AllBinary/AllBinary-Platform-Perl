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

package org::allbinary::input::motion::button::TouchButtonFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::input::motion::button::TouchButtonFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{LIST} = 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
    $self->{list} = $self->{LIST};
    $self->{savedList} = $self->{LIST};
    $self->{saved} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::motion::button::TouchButtonFactory::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub defaultList {
    my ($self) = @_;
        $self->{list} = $self->{LIST};
        $self->toggle(0, $self->{LIST});
}


sub toggle {
    my ($self, $save, $list) = @_;
        if ($list != 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance()) {
            $self->{savedList} = $list;
            if (!$self->{saved}) {
                $self->{list} = $self->{savedList};
            }
        } else {
            if ($save) {
                if (!$self->{saved}) {
                    $self->{saved} = 1;
                    $self->{savedList} = $self->{list};
                    $self->{list} = $self->{LIST};
                } else {
                }
            } else {
                $self->{list} = $self->{savedList};
                $self->{saved} = 0;
            }
        }
}


# throws Exception
sub setList {
    my ($self, $list) = @_;
        if (!defined($list)) {
            die ("Null List");
        }
        $self->{list} = $list;
}


sub getList {
    my ($self) = @_;
        return $self->{list};
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListUtil;

1;

