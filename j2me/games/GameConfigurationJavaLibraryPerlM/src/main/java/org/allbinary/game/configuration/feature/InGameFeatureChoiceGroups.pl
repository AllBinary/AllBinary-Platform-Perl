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

package org::allbinary::game::configuration::feature::InGameFeatureChoiceGroups;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $gameFeatureChoiceGroupsExclusive, 'java::lang::LazyStatic', sub { 'org::allbinary::game::configuration::feature::InGameFeatureChoiceGroups'->new() };
tie our $gameFeatureChoiceGroupsMultiple, 'java::lang::LazyStatic', sub { 'org::allbinary::game::configuration::feature::InGameFeatureChoiceGroups'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{hashtable} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getExclusiveInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::feature::InGameFeatureChoiceGroups::gameFeatureChoiceGroupsExclusive;
}


sub getMultipleInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::feature::InGameFeatureChoiceGroups::gameFeatureChoiceGroupsMultiple;
}


sub get {
    my ($self) = @_;
        return $self->{hashtable};
}


sub add {
    my ($self, $name, $list) = @_;
        $self->{hashtable}->put($name, $list);
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::StdUtil ();
use org::allbinary::util::ABHashtable ();
use org::allbinary::util::BasicArrayList ();

1;

