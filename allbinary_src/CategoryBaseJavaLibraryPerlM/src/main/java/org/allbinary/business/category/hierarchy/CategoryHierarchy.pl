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

package org::allbinary::business::category::hierarchy::CategoryHierarchy;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::category::hierarchy::CategoryHierarchyInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{rootCategoryInterface} = undef;
    $self->{parentCategoryInterface} = undef;
    $self->{level} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    die "No constructor of CategoryHierarchy takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $rootCategoryInterface, $parentCategoryInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{level} = 0;
        $self->setRoot($rootCategoryInterface);
        $self->setParent($parentCategoryInterface);
    return $self;
}


sub _new3 {
    my ($class, $rootCategoryInterface, $parentCategoryInterface, $level) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{level} = $level;
        $self->setRoot($rootCategoryInterface);
        $self->setParent($parentCategoryInterface);
    return $self;
}


sub _new3 {
    my ($class, $rootCategoryInterface, $parentCategoryInterface, $categoryPropertiesHashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $levelString = 'org::allbinary::logic::string::StringUtil'->getInstance()->getNonNull($categoryPropertiesHashMap->get('org::allbinary::business::category::CategoryData'->getInstance()->{LEVEL}));
        $self->{level} = int(("" . ($levelString)));
        $self->setRoot($rootCategoryInterface);
        $self->setParent($parentCategoryInterface);
    return $self;
}


sub getLevel {
    my ($self) = @_;
        return $self->{level};
}


sub getLevelString {
    my ($self) = @_;
        return ("" . ($self->{level}));
}


sub setLevel {
    my ($self, $level) = @_;
        $self->{level} = $level;
}


sub setParent {
    my ($self, $categoryInterface) = @_;
        $self->{parentCategoryInterface} = $categoryInterface;
}


sub setRoot {
    my ($self, $categoryInterface) = @_;
        $self->{rootCategoryInterface} = $categoryInterface;
}


sub getRoot {
    my ($self) = @_;
        return $self->{rootCategoryInterface};
}


sub getParent {
    my ($self) = @_;
        return $self->{parentCategoryInterface};
}

use java::util::HashMap;
use org::allbinary::business::category::CategoryData;
use org::allbinary::business::category::CategoryInterface;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::business::category::hierarchy::CategoryHierarchyInterface;

1;

