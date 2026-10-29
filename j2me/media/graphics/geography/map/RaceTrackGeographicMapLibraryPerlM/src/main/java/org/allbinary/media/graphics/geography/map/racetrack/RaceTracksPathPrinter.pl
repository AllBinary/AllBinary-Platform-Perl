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

package org::allbinary::media::graphics::geography::map::racetrack::RaceTracksPathPrinter;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub printPath {
    my ($self, $list) = @_;
        my $size = $list->size();
        for (my $index = 0; $index < $size; $index++) {
            my $anyType = $list->get($index);
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append("pathList.add(cellPositionFactory.getInstance")->append($anyType->toString())->append(");")->toString(), $self, "printPath");
        }
}


sub printPaths {
    my ($self, $list) = @_;
        my $size = $list->size();
        for (my $index = 0; $index < $size; $index++) {
            print('org::allbinary::logic::string::StringMaker'->new()->append(" Path ")->appendint($index)->append('org::allbinary::string::CommonLabels'->getInstance()->{COLON_SEP})->toString(), "\n");
            $self->printPath($list->get($index));
        }
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::string::CommonLabels;
use java::lang::System;

1;

