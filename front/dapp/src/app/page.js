"use client";

import Head from "next/head";
import { useRouter } from "next/navigation";
import { useState } from "react";
import { doLogin } from "@/services/Web3Service";

export default function Home() {
  
  const { push } = useRouter();

  const [message, setMessage] = useState();

  function btnLoginClick() {
    // Handle login button click
    setMessage("Conectando na carteira...aguarde...");
    doLogin()
      .then(account => push("/registrar"))
      .catch(err => {
        console.error(err);
        setMessage(err.message);
      });
  }

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
          <p className="lead">Aplicativo para registro, transferência, compra e venda de animais.</p>
          <p className="lead">Autentique-se com sua carteira e faça o registro de seus animais.</p>
          <div className="d-flex justify-content-start">
            <button type="button" className="btn btn-primary btn-lg px-4" onClick={btnLoginClick}>
              <img src="/metamask.svg" width={64} className="me-3"/>
              Conectar com a MetaMask
            </button>
          </div>
          <p className="message">{message}</p>
        </div>
      </div>
      <footer className="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
        <p className="col-4 mb-0 text-body-secondary">
          &copy; 2025 Universidade Federal de Lavras - UFLA
        </p>
        <ul className="nav col-4 justify-content-end">
          <li className="nav-item"> <a href="/" className="nav-link px-2 text-body-secondary">Home</a></li>
          <li className="nav-item"> <a href="/about" className="nav-link px-2 text-body-secondary">About</a></li>
        </ul>
      </footer>
    </div>
    </>
  );
}
