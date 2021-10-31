FROM swift:xenial as build

WORKDIR /bench

COPY . .

RUN swift build -Xswiftc -static-executable -c release

FROM scratch as runtime
WORKDIR /bench
COPY --from=build /bench/.build/release/benchtool-swift /bench/benchtool-swift

ENTRYPOINT ["/bench/benchtool-swift"]