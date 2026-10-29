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
package org::allbinary::business::advertisement::AdvertisementInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getArtist {
    my ($self) = @_;
    die "abstract method getArtist";
}


sub getArtistLink {
    my ($self) = @_;
    die "abstract method getArtistLink";
}


sub getTitle {
    my ($self) = @_;
    die "abstract method getTitle";
}


sub getDateAdded {
    my ($self) = @_;
    die "abstract method getDateAdded";
}


sub getDirectory {
    my ($self) = @_;
    die "abstract method getDirectory";
}


sub getFramedLink {
    my ($self) = @_;
    die "abstract method getFramedLink";
}


sub getListPrice {
    my ($self) = @_;
    die "abstract method getListPrice";
}


sub getOurPrice {
    my ($self) = @_;
    die "abstract method getOurPrice";
}


sub getRank {
    my ($self) = @_;
    die "abstract method getRank";
}


sub getImage {
    my ($self) = @_;
    die "abstract method getImage";
}


sub getProduct {
    my ($self) = @_;
    die "abstract method getProduct";
}


sub getThumbnail {
    my ($self) = @_;
    die "abstract method getThumbnail";
}


sub getDisplayInBrowserContraintsInterface {
    my ($self) = @_;
    die "abstract method getDisplayInBrowserContraintsInterface";
}


sub setArtist {
    my ($self, $artist) = @_;
    die "abstract method setArtist";
}


sub setArtistLink {
    my ($self, $artistLink) = @_;
    die "abstract method setArtistLink";
}


sub setTitle {
    my ($self, $title) = @_;
    die "abstract method setTitle";
}


sub setDateAdded {
    my ($self, $dateAdded) = @_;
    die "abstract method setDateAdded";
}


sub setDirectory {
    my ($self, $directory) = @_;
    die "abstract method setDirectory";
}


sub setFramedLink {
    my ($self, $framedLink) = @_;
    die "abstract method setFramedLink";
}


sub setRank {
    my ($self, $rank) = @_;
    die "abstract method setRank";
}


sub setImage {
    my ($self, $AdvertisementImageInterface) = @_;
    die "abstract method setImage";
}


sub setProduct {
    my ($self, $AdvertisementProductInterface) = @_;
    die "abstract method setProduct";
}


sub setThumbnail {
    my ($self, $AdvertisementThumbnailInterface) = @_;
    die "abstract method setThumbnail";
}

use org::allbinary::business::advertisement::image::AdvertisementImageInterface;
use org::allbinary::business::advertisement::product::AdvertisementProductInterface;
use org::allbinary::business::advertisement::thumbnail::AdvertisementThumbnailInterface;
use org::allbinary::business::user::commerce::money::Money;
use org::allbinary::logic::control::contraints::display::browser::DisplayInBrowserContraintsInterface;

1;

