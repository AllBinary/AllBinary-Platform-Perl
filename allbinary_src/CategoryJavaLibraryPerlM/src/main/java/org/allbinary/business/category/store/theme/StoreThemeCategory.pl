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

package org::allbinary::business::category::store::theme::StoreThemeCategory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::category::Category','org::allbinary::business::category::store::theme::StoreThemeCategoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{transformInfoInterface} = undef unless exists $self->{transformInfoInterface};
    $self->{themeVector} = undef unless exists $self->{themeVector};
}

sub new {
    my ($class, @arguments) = @_;
    return _new3($class, @arguments) if scalar(@arguments) == 3;
    return _new4($class, @arguments) if scalar(@arguments) == 4;
    return _new4($class, @arguments) if scalar(@arguments) == 4;
    return _new5($class, @arguments) if scalar(@arguments) == 5;
    die "No constructor of StoreThemeCategory takes " . scalar(@arguments) . " arguments";
}

sub _new4 {
    my ($class, @arguments) = @_;
    return _new4_1($class, @arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY')) && (!defined($arguments[2]) || (ref($arguments[2]) && ref($arguments[2]) ne 'ARRAY')) && (!defined($arguments[3]) || (ref($arguments[3]) && ref($arguments[3]) ne 'ARRAY'));
    return _new4_2($class, @arguments);
}


sub _new3 {
    my ($class, $transformInfoInterface, $categoryPropertiesFactoryInterface, $level) = @_;
    my $self = $class->SUPER::new($categoryPropertiesFactoryInterface, $level);
    _init_fields($self);
        # super(...) made $self above
        $self->{transformInfoInterface} = $transformInfoInterface;
        $self->{themeVector} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


sub _new4_1 {
    my ($class, $transformInfoInterface, $rootCategoryInterface, $parentCategoryInterface, $categoryPropertiesFactoryInterface) = @_;
    my $self = $class->SUPER::new($rootCategoryInterface, $parentCategoryInterface, $categoryPropertiesFactoryInterface);
    _init_fields($self);
        # super(...) made $self above
        $self->{transformInfoInterface} = $transformInfoInterface;
        $self->{themeVector} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


sub _new4_2 {
    my ($class, $transformInfoInterface, $node, $categoryPropertiesFactoryInterface, $level) = @_;
    my $self = $class->SUPER::new($categoryPropertiesFactoryInterface, $level);
    _init_fields($self);
        # super(...) made $self above
        $self->{transformInfoInterface} = $transformInfoInterface;
        $self->{themeVector} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->addThemes($node);
    return $self;
}


sub _new5 {
    my ($class, $transformInfoInterface, $node, $rootCategoryInterface, $parentCategoryInterface, $categoryPropertiesFactoryInterface) = @_;
    my $self = $class->SUPER::new($rootCategoryInterface, $parentCategoryInterface, $categoryPropertiesFactoryInterface);
    _init_fields($self);
        # super(...) made $self above
        $self->{transformInfoInterface} = $transformInfoInterface;
        $self->{themeVector} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->addThemes($node);
    return $self;
}


sub getTransformInfoInterface {
    my ($self) = @_;
        return $self->{transformInfoInterface};
}


# throws Exception
sub addThemes {
    my ($self, $node) = @_;
        my $themesNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::logic::visual::theme::ThemesData'->getInstance()->{NAME}, $node->getChildNodes());
        my $nodeList = $themesNode->getChildNodes();
        for (my $index = 0; $index < $nodeList->getLength(); $index++) {
            my $themeNode = $nodeList->item($index);
            if ($themeNode->getNodeName()->compareTo('org::allbinary::logic::visual::theme::ThemeData'->getInstance()->{NAME}) == 0) {
                $self->{themeVector}->add('org::allbinary::logic::visual::theme::ThemeValidation'->new($self, $themeNode));
            }
        }
}


sub addTheme {
    my ($self, $themeValidation) = @_;
        $self->{themeVector}->add($themeValidation);
}


sub getThemes {
    my ($self) = @_;
        return $self->{themeVector};
}


# throws Exception
sub isValid {
    my ($self) = @_;
        if (!$self->SUPER::isValid()) {
            return 0;
        }
        return 1;
}


# throws Exception
sub toHashMap {
    my ($self) = @_;
        my $categoryHashMap = $self->SUPER::toHashMap();
        $categoryHashMap->put('org::allbinary::logic::visual::theme::ThemesData'->getInstance()->{NAME}, $self->{themeVector});
        return $categoryHashMap;
}


# throws Exception
sub toVector {
    my ($self) = @_;
        my $categoryVector = $self->SUPER::toVector();
        return $categoryVector;
}

use java::lang::Object ();
use java::util::HashMap ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();
use org::allbinary::business::category::Category ();
use org::allbinary::business::category::CategoryInterface ();
use org::allbinary::business::category::properties::CategoryPropertiesFactoryInterface ();
use org::allbinary::data::tree::dom::DomSearchHelper ();
use org::allbinary::logic::StdUtil ();
use org::allbinary::logic::visual::theme::ThemeData ();
use org::allbinary::logic::visual::theme::ThemeValidation ();
use org::allbinary::logic::visual::theme::ThemesData ();
use org::allbinary::logic::visual::transform::info::TransformInfoInterface ();
use org::w3c::dom::Node ();
use org::w3c::dom::NodeList ();
use org::allbinary::business::category::store::theme::StoreThemeCategoryInterface ();

1;

