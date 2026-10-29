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
package org::allbinary::logic::visual::transform::BasicTransformerInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::CompositeTransformInfoInterface';



sub setInputStream {
    my ($self, $inputStream) = @_;
    die "abstract method setInputStream";
}


sub setURIResolver {
    my ($self, $uriResolver) = @_;
    die "abstract method setURIResolver";
}


sub getStreamSource {
    my ($self) = @_;
    die "abstract method getStreamSource";
}


sub getInputStream {
    my ($self) = @_;
    die "abstract method getInputStream";
}


sub getURIResolver {
    my ($self) = @_;
    die "abstract method getURIResolver";
}


# throws Exception
sub translate {
    my ($self, $xmlDocumentStr) = @_;
    die "abstract method translate";
}

# use java::io::InputStream;
# use javax::xml::transform::URIResolver;
# use javax::xml::transform::stream::StreamSource;
use org::allbinary::logic::visual::transform::info::CompositeTransformInfoInterface;

1;

