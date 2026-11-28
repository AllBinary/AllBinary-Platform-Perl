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

package org::allbinary::logic::io::file::visitor::BooleanFileVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::logic::util::visitor::VisitorInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{filterStringBasicArrayList} = undef unless exists $self->{filterStringBasicArrayList};
}


sub new {
    my ($class, $filterStringBasicArrayList) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->setFilterStringBasicArrayList($filterStringBasicArrayList);
        'org::allbinary::logic::communication::log::PreLogUtil'->put("Filter BasicArrayList: " . $self->getFilterStringBasicArrayList()->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
    return $self;
}


sub visit_j1_1 {
    my ($self, $anyType) = @_;
        return $self->visit($anyType);
}


sub visit_j1_2 {
    my ($self, $file) = @_;
        my $list = $self->getFilterStringBasicArrayList();
        my $size = $list->size();
        my $nextFileFilterString = undef;
        for (my $index = 0; $index < $size; $index++) {
            $nextFileFilterString = $list->get($index);
            if ($self->visit($file, $nextFileFilterString)) {
                return 1;
            }
        }
        return 0;
}


sub getFilterStringBasicArrayList {
    my ($self) = @_;
        return $self->{filterStringBasicArrayList};
}


sub setFilterStringBasicArrayList {
    my ($self, $filterStringBasicArrayList) = @_;
        $self->{filterStringBasicArrayList} = $filterStringBasicArrayList;
}


sub visit_j2 {
    my ($self, $file, $fileNameString) = @_;
        return 0;
}

sub visit {
    my ($invocant, @arguments) = @_;
    return $invocant->visit_j1(@arguments) if scalar(@arguments) == 1;
    return $invocant->visit_j2(@arguments) if scalar(@arguments) == 2;
    die "No method visit takes " . scalar(@arguments) . " arguments";
}

sub visit_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->visit_j1_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->visit_j1_2(@arguments);
}

use java::lang::Object ();
use org::allbinary::logic::communication::log::PreLogUtil ();
use org::allbinary::logic::io::file::AbFile ();
use org::allbinary::logic::util::visitor::VisitorInterface ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::util::BasicArrayList ();

1;

