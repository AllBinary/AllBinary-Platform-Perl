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

package org::allbinary::logic::visual::dhtml::style::css::property::font::FontFamilyView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyView';


sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of FontFamilyView takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::logic::visual::dhtml::style::css::property::font::FontFamilyData'->getInstance()->{VALUE});
        # super(...) made $self above
    return $self;
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = $class->SUPER::new($node);
        # super(...) made $self above
    return $self;
}

use org::allbinary::logic::visual::dhtml::style::css::property::CssPropertyView;
use org::w3c::dom::Node;
use org::allbinary::logic::visual::dhtml::style::css::property::font::FontFamilyData;

1;

