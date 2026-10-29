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

package views::generic::inventory::InventorySearchLoopInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{lastPage} = -1;
    $self->{currentPage} = -1;
    $self->{numberOfResultsOnCurrentPage} = 0;
    $self->{numberOfResults} = 0;
    $self->{CURRENT} = "current: ";
    $self->{NUM} = " num: ";
    $self->{LAST} = " last: ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{CURRENT});
        $stringBuffer->appendint($self->{currentPage});
        $stringBuffer->append($self->{NUM});
        $stringBuffer->appendint($self->{numberOfResults});
        $stringBuffer->append($self->{LAST});
        $stringBuffer->appendint($self->{lastPage});
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;

1;

