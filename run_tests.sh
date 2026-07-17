#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
exec bb -e '
(require (quote clojure.test)
         (quote hokorobi.methods.test-datom-emit)
         (quote hokorobi.methods.test-ie-flow)
         (quote hokorobi.murakumo-test)
         (quote hokorobi.social-publication-test)
         (quote hokorobi.tests.test-analyze)
         (quote hokorobi.tests.test-contagion-linchpins)
         (quote hokorobi.tests.test-coverage)
         (quote hokorobi.tests.test-kotoba))
(let [namespaces [                  (quote hokorobi.methods.test-datom-emit)
                  (quote hokorobi.methods.test-ie-flow)
                  (quote hokorobi.murakumo-test)
                  (quote hokorobi.social-publication-test)
                  (quote hokorobi.tests.test-analyze)
                  (quote hokorobi.tests.test-contagion-linchpins)
                  (quote hokorobi.tests.test-coverage)
                  (quote hokorobi.tests.test-kotoba)]
      result (apply clojure.test/run-tests namespaces)]
  (System/exit (if (zero? (+ (:fail result) (:error result))) 0 1)))'
