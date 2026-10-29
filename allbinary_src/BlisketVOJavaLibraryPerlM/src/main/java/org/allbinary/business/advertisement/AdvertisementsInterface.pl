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
package org::allbinary::business::advertisement::AdvertisementsInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub add {
    my ($self, $advertisementInterface) = @_;
    die "abstract method add";
}


sub get {
    my ($self, $index) = @_;
    die "abstract method get";
}


sub getCurrentPageNum {
    my ($self) = @_;
    die "abstract method getCurrentPageNum";
}


sub getErrorDescription {
    my ($self) = @_;
    die "abstract method getErrorDescription";
}


sub getErrorNum {
    my ($self) = @_;
    die "abstract method getErrorNum";
}


sub getNumberOfPosters {
    my ($self) = @_;
    die "abstract method getNumberOfPosters";
}


sub getNumberOfProductsInPage {
    my ($self) = @_;
    die "abstract method getNumberOfProductsInPage";
}


sub getStatusCode {
    my ($self) = @_;
    die "abstract method getStatusCode";
}


sub getTotalNumberOfProducts {
    my ($self) = @_;
    die "abstract method getTotalNumberOfProducts";
}


sub isSearchValid {
    my ($self) = @_;
    die "abstract method isSearchValid";
}


sub setCurrentPageNum {
    my ($self, $currentPageNum) = @_;
    die "abstract method setCurrentPageNum";
}


sub setErrorDescription {
    my ($self, $errorDescription) = @_;
    die "abstract method setErrorDescription";
}


sub setErrorNum {
    my ($self, $errorNum) = @_;
    die "abstract method setErrorNum";
}


sub setNumberOfProductsInPage {
    my ($self, $numberOfProductsInPage) = @_;
    die "abstract method setNumberOfProductsInPage";
}


sub setStatusCode {
    my ($self, $statusCode) = @_;
    die "abstract method setStatusCode";
}


sub setTotalNumberOfProducts {
    my ($self, $totalNumberOfProducts) = @_;
    die "abstract method setTotalNumberOfProducts";
}


sub toString {
    my ($self) = @_;
    die "abstract method toString";
}


1;

