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

# Java interface
package org::allbinary::business::advertisement::search::AdvertisementSearchInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getWebSite {
    my ($self) = @_;
    die "abstract method getWebSite";
}


sub getCategory {
    my ($self) = @_;
    die "abstract method getCategory";
}


sub getSizeConstraints {
    my ($self) = @_;
    die "abstract method getSizeConstraints";
}


sub getPricingConstraints {
    my ($self) = @_;
    die "abstract method getPricingConstraints";
}


sub getPageNumber {
    my ($self) = @_;
    die "abstract method getPageNumber";
}


sub getProductsPerPage {
    my ($self) = @_;
    die "abstract method getProductsPerPage";
}


sub getSearchParams {
    my ($self) = @_;
    die "abstract method getSearchParams";
}


sub setCategory {
    my ($self, $advertisementCategoryInterface) = @_;
    die "abstract method setCategory";
}


sub setSizeConstraints {
    my ($self, $twoDimensionConstraintsInterface) = @_;
    die "abstract method setSizeConstraints";
}


sub setPricingConstraints {
    my ($self, $priceConstraintInterface) = @_;
    die "abstract method setPricingConstraints";
}


sub setPageNumber {
    my ($self, $pageNumber) = @_;
    die "abstract method setPageNumber";
}


sub setProductsPerPage {
    my ($self, $productsPerPage) = @_;
    die "abstract method setProductsPerPage";
}


sub setSearchParams {
    my ($self, $columnAndKeywordHashMap) = @_;
    die "abstract method setSearchParams";
}

use java::util::HashMap;
use org::allbinary::business::advertisement::search::category::AdvertisementCategoryInterface;
use org::allbinary::business::advertisement::search::website::AdvertisementWebsiteInterface;
use org::allbinary::logic::control::contraints::price::PriceConstraintInterface;
use org::allbinary::logic::control::contraints::size::TwoDimensionalConstraintInterface;

1;

