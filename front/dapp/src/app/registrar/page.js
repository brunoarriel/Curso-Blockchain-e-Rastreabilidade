"use client";

import Head from "next/head";
export default function Registrar() {
  
  return (
    <>
    <Head>
      <title>Registra Animal | Login</title>
      <meta charSet="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
    </Head>
    <div className="container px-4 py-5">
      <div className="row flex-lg-row-reverse align-items-center g-5 py-5">
        <div className="col-6">
          <img src="https://images.unsplash.com/photo-1554839465-be8f7c6786b5?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1470" className="d-block mx-lg-auto img-fluid" width="700" height="500" />
        </div>
        <div className="col-6">
          <h1 className="display-5 fw-bold text-body-emphasis lh-1 mb-3">Registra Animal</h1>
          </div>         
        </div>
      </div>
    </>
  );
}
