# Generated Code Do Not Modify

package org::apache::xmlrpc::XmlRpcClient;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::apache::xmlrpc::XmlRpcHandler';


sub _init_fields {
    my ($self) = @_;
    $self->{url} = undef;
}


sub new {
    my ($class, $url) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{url} = 'java::net::URL'->new($url);
    return $self;
}


sub getURL {
    my ($self) = @_;
        return $self->{url};
}


sub setBasicAuthentication {
    my ($self, $user, $password) = @_;
}


# throws XmlRpcException, IOException
sub execute {
    my ($self, $method, $params) = @_;
        return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
}


# throws XmlRpcException, IOException
# Java overloaded method: Perl keeps the last definition
sub execute {
    my ($self, $method, $params, $cryptInterface) = @_;
        return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
}

# use java::io::IOException;
# use java::net::MalformedURLException;
# use java::net::URL;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::init::crypt::jcehelper::CryptInterface;
use org::allbinary::logic::NullUtil;
use org::apache::xmlrpc::XmlRpcHandler;

1;

